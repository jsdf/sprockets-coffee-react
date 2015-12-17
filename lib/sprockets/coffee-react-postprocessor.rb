require 'sprockets'
require 'tilt'
require 'coffee-react'

module Sprockets
  class CoffeeReactPostprocessor < Tilt::Template

    def prepare
    end

    def evaluate(scope, locals, &block)
      ::CoffeeReact.jstransform(data)
    end
  end
end
