Dir.chdir File.join File.dirname(__FILE__), '../'
require './lib/jsdj.rb'

describe "Compile" do
  it "Does allow you to compile a javascript file and return the same result with no modifications" do
    js_src = %{
      function hello() {
      }
    }

    dj = Jsdj.new do |dj|
      #When ever the function puts(...) is written in javascript,
      #It will be replaced by what ever is returned within this
      #block. i.e. makes the function call an inlined macro
      dj.function "puts" do |params|
        raise "must have one function argument" if params.length != 1
        raise "argument must be a string literal" if params[0].class != Jsdj::JSStringLiteral
      end
    end

    js_src2 = dj.compile(js_src)
    expect(js_src2).to eq(js_src)
  end
end
