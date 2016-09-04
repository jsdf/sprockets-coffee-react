# encoding: utf-8
require 'sprockets'
require 'sprockets/coffee-react'
require 'sprockets/coffee-react-postprocessor'

if defined?(Rails)
  module Sprockets
    class CoffeeReact
      class Engine < ::Rails::Engine
        initializer :setup_coffee_react, :after => "sprockets.environment", :group => :all do |app|
          if app.assets
            configure_env app.assets
          else
            app.config.assets.configure { |env| self.class.install env }
          end
        end

        def self.install(environment)
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
  end
end
