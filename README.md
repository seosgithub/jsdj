![jsdj: Remix your javascript](https://raw.githubusercontent.com/sotownsend/jsdj/master/logo.png)

[![Gem Version](https://badge.fury.io/rb/iarrogant.svg)](http://badge.fury.io/rb/jsdj)
[![Build Status](https://travis-ci.org/sotownsend/jsdj.svg)](https://travis-ci.org/sotownsend/jsdj)
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/sotownsend/jsdj/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
[![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/sotownsend/jsdj/blob/master/LICENSE)

# What is this?

**Jsdj** was purpose built for [Flok](http://github.com/sotownsend/flok) to allow for macros within javascript code that look
like traditional javascript code.

# How to use it
```ruby
dj = Jsdj.new do |dj|
  #When ever the function puts(...) is written in javascript,
  #It will be replaced by what ever is returned within this
  #block. i.e. makes the function call an inlined macro
  dj.function "puts" do |params|
    raise "must have one function argument" if params.length != 1
    raise "argument must be a string literal" if params[0].class != Jsdj::JSStringLiteral
  end
end

#Given a js src string, jsdj will return a js src string
#that contains modifications
result = dj.compile(src)
```

# Create a function macro
**Jsdj** can parse javascript and take any function calls of a certain name and replace them with 
your specified macro. When you get arguments for a function in **Jsdj**, the arguments have a type.
E.g. `JSStringLiteral`

```ruby
dj.function "puts" do |params|
  raise "argument must be a string literal" if params[0].class != Jsdj::JSStringLiteral
end
```

  * **Supported Types**
    * `JSStringLiteral` - A javascript string literal in quotes (single or double), e.g. `foo("bar")`
      * `value` contains the full string as a ruby string
    * `JSNumber` - A number
      * `value` contains the value as a number
    * `JSOther` - Some other kind of expression, either mixed, hash, etc.
  * **Unsupported Types**
    * `anonymous functions` - Attempting to use an anonymous function will result in
        undefined behavior. Anonymous functions can be contained within a hash.
Expression

# Supported platforms
 * iOS 8 (iPhone)
 * HTML5

## Docs

## Requirements

- Modern **nix** (FreeBSD, Mac, or Linux)
- Ruby 2.1 or Higher

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation

RVM users:
Run `gem install jsdj`

System ruby installation?
Run `sudo gem install jsdj`

---

## FAQ

* * *

### Creator

- [Seo Townsend](http://github.com/sotownsend) ([@seotownsend](https://twitter.com/seotownsend))

## License

flok is released under the MIT license. See LICENSE for details.
