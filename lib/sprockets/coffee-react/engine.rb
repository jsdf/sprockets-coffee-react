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
            app.config.assets.configure { |env| configure_env env }
          end
        end

        def configure_env(env)
          if env.respond_to?(:register_transformer)
            env.register_mime_type 'application/javascript', extensions: ['.cjsx'], charset: :javascript
            env.register_mime_type 'application/javascript', extensions: ['.js.cjsx'], charset: :javascript
          else
            env.register_engine '.cjsx', Sprockets::CoffeeReactScript
            env.register_engine '.js.cjsx', Sprockets::CoffeeReactScript
          end
          env.register_preprocessor 'application/javascript', Sprockets::CoffeeReact
          env.register_postprocessor 'application/javascript', Sprockets::CoffeeReactPostprocessor
        end
      end
    end
  end
end
