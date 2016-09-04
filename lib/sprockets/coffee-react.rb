# encoding: utf-8
require 'sprockets'
require 'tilt'
require 'coffee-react'
require 'sprockets/coffee-react-postprocessor'

module Sprockets
  # Preprocessor that runs CJSX source files through coffee-react-transform
  class CoffeeReact < Tilt::Template
    CJSX_EXTENSION = /\.(:?cjsx|coffee)[^\/]*?$/
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
      if filename =~ CJSX_EXTENSION || source =~ CJSX_PRAGMA
        ::CoffeeReact.transform(source)
      else
        source
      end
    end

    def self.install(environment = ::Sprockets)
      Sprockets::CoffeeReact::Engine.install(environment)
    end
  end
end
