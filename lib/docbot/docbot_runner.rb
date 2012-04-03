require 'csv'
module DocbotRunner
  class << self
      @@template = <<EOF
      # {{method_scope}}: <description method>
      #
      # {{arguments}}
      #
      # Examples
      #
      #   {{method_signature}}
      #   # => Sample Output
      #
      # Returns <description of returned variable>
      def {{method_signature}}
EOF

    def scribble(opts = {})
      options = {}.merge(opts)
    end

    def document_one_file(file_name)
      if File.exist?(file_name)
        @f = File.read(file_name)
        methods_hash(@f).each do |m|
        end
      end
    end

    def erase(opts = {})
      options = {}.merge(opts)
    end

    private
    def methods_hash(str)
      methods = []
      unless str.nil?
        exp = Regexp.new(/^\s*def\s([^\s\(]*)/)
        str.scan(exp).flatten.each do | m |
          methods << { :name => m, :args => arguments_for(m, str) }
        end
      end
      methods
    end
    def arguments_for(m, str)
      exp = Regexp.new(/^\s*def\s#{m}(.*[^\)|$])/)
      args = str.scan(exp).flatten
      args = args.map{ |x| x.gsub(/\n+/, "").strip }
      args = args.reject{|x| x.empty?}
      args.map{ |x|x.gsub!(/^\(/,'') }
      args.map{ |x|x.gsub!(/\)$/,'') }
      args = args.join.scan(/(?:[^,(]|\([^)]*\))+/)
    end
  end
end