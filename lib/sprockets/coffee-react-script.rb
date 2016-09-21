require 'sprockets'
require 'tilt'
require 'coffee-react'
require 'coffee_script'

module Sprockets
  # Preprocessor that runs CJSX source files through coffee-react-transform
  # then compiles with coffee-script
  class CoffeeReactScript < Tilt::Template
    COFFEE_CJSX_EXTENSION = /\.coffee\.cjsx/
    CJSX_EXTENSION = /\.cjsx[^\/]*?$/
    CJSX_PRAGMA = /^\s*#[ \t]*@cjsx/i

    def prepare
    end

    def evaluate(scope, locals, &block)
      self.class.run(scope.pathname.to_s, data)
    end

    def self.call(input)
      filename  = input[:source_path] || input[:filename]
      source    = input[:data]
      run(filename, source)
    end

    def self.run(filename, source)
      if filename =~ COFFEE_CJSX_EXTENSION
        ::CoffeeReact.transform(source)
      elsif filename =~ CJSX_EXTENSION || source =~ CJSX_PRAGMA
        ::CoffeeScript.compile(::CoffeeReact.transform(source))
      else
        source
      end
    end

  end
end
