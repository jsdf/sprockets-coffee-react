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
      if scope.pathname.to_s =~ CJSX_EXTENSION || data =~ CJSX_PRAGMA
        ::CoffeeReact.transform(data)
      else
        data
      end
    end

    def self.install(environment = ::Sprockets)
      environment.register_preprocessor 'application/javascript', Sprockets::CoffeeReact
      environment.register_postprocessor 'application/javascript', Sprockets::CoffeeReactPostprocessor
      environment.register_engine '.cjsx', Sprockets::CoffeeReactScript
      environment.register_engine '.js.cjsx', Sprockets::CoffeeReactScript
    end
  end
end
