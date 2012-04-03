require 'helper'
require 'ruby-debug'
begin
  require 'foo'
rescue LoadError
  fixture_path = "#{File.dirname(__FILE__)}/fixtures/"
  if File.directory?(fixture_path)
    $:.unshift fixture_path
    require 'foo'
  end
end
require 'docbot/docbot_runner'
class TestDocbot < Test::Unit::TestCase

  should "be able to isolate just the method names and their arguments for the class" do
    @f = File.read("#{File.dirname(__FILE__)}/fixtures/foo.rb")
    assert_equal DocbotRunner.send(:methods_hash, @f),
      [{:name=>"boilerplate_documentation", :args=>[]},
       {:name=>"baz", :args=>["*args"]},
       {:name=>"custom_comment", :args=>[]},
       {:name=>"no_params", :args=>["a", " b"]},
       {:name=>"protected_foo", :args=>["a", "b"]},
       {:name=>"protected_foo", :args=>["a", "b"]},
       {:name=>"modified_documentation", :args=>["a", "b = \"some optional string\""]},
       {:name=>"private_foo", :args=>["foo = nil"]},
       {:name=>"public_foo", :args=>["*args"]},
       {:name=>"self.bar", :args=>["foo", " bar", " baz = \"(baz)\""]},
       {:name=>"protected_poo",
        :args=>["foo = { :foo => 'bar', :bar => 'baz' }", " &block"]},
       {:name=>"space_after_def", :args=>[]}]
      end

  should "skip methods that are previously documented" do
  end
  should "update outdated boilerplate documentation"
  should "not update documentation if it is no longer boilerplate"
end
