require 'sprockets'
require 'tilt'
require 'coffee-react'

module Sprockets
  class CoffeeReactPostprocessor < Tilt::Template

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
      ::CoffeeReact.jstransform(source)
    end

  end
end
