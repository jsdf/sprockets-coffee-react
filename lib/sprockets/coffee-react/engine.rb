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
          env.register_mime_type 'application/x-cjsx', extensions: ['.cjsx', '.js.cjsx']
          env.register_transformer 'application/x-cjsx', 'application/javascript', Sprockets::CoffeeReactScript
        end
      end
    end
  end
end
