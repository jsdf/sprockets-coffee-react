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
      self.class.run(scope.pathname, data)
    end

    def self.call(input)
      filename  = input[:source_path] || input[:filename]
      source    = input[:data]
      run(filename, source)
    end

    def self.run(filename, source)
      if filename.to_s =~ CJSX_EXTENSION || source =~ CJSX_PRAGMA
        ::CoffeeReact.transform(source)
      else
        source
      end
    end

    def self.install(environment = ::Sprockets)
      if environment.respond_to?(:register_transformer)
        environment.register_mime_type 'application/javascript', extensions: ['.cjsx'], charset: :javascript
        environment.register_mime_type 'application/javascript', extensions: ['.js.cjsx'], charset: :javascript
      else
        environment.register_engine '.cjsx', Sprockets::CoffeeReactScript
        environment.register_engine '.js.cjsx', Sprockets::CoffeeReactScript
      end
      environment.register_preprocessor 'application/javascript', Sprockets::CoffeeReact
      environment.register_postprocessor 'application/javascript', Sprockets::CoffeeReactPostprocessor
    end
  end
end
