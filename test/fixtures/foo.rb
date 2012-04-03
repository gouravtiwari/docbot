class Foo

  # Public: 
  #
  #
  # Examples
  #
  #   boilerplate_documentation()
  #   # => Some Value
  #
  # Returns some value
  def boilerplate_documentation
  end

  def baz *args
  end

  #
  # def foo
  #   puts "it should ignore this comment even though it looks like a method definiton"
  # end
  #
  def custom_comment
  end
  class << self
    def no_params a, b
    end

    protected
    def protected_foo(a,b)
      @a = <<EOF
        def protected_foo
          puts "it should not generate documentation for this"
        end
EOF
    end

    # Protected: This method does very little
    #
    # a  - The String
    # b - The String
    #
    # Examples
    #
    #   modified_documentation('a', 'b')
    #   # => 'a : b'
    #
    # Returns the modified String.
    def modified_documentation(a,b = "some optional string")
      "#{a} : #{b}"
    end

    private
    def private_foo(foo = nil)
    end

    public
    def public_foo(*args)
    end
  end

  def self.bar(foo, bar, baz = "(baz)")
  end

  protected
  def protected_poo(arr = ['a','b','c'], foo = { :foo => 'bar', :baz => "{'foo' : 'bar', 'bar' : 'biff' }", :bar => 'baz' }, &block)
  end

  private
  def space_after_def ()
  end
end