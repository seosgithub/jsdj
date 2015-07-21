Dir.chdir File.join File.dirname(__FILE__), '../'
require './lib/jsdj.rb'

describe "Function" do
  it "Does allow you to define a function with no args macro and replaces inside with text" do
    js_src = "foo();"

    djc = Jsdj.new do |dj|
      dj.function :foo do
        next "hello_world"
      end
    end

    res_src = djc.compile(js_src)

    expect(res_src).to eq("hello_world")
  end
end
