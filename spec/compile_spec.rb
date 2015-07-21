Dir.chdir File.join File.dirname(__FILE__), '../'
require './lib/jsdj.rb'

describe "Compile" do
  it "Does allow you to compile a javascript file and return the same result with no modifications" do
    js_src = %{
      function hello() {
      }
    }

    djc = Jsdj.new do |dj|
    end

    js_src2 = djc.compile(js_src)
    expect(js_src2).to eq(js_src)
  end
end
