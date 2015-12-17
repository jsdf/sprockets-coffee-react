require 'sprockets'
require 'sprockets/coffee-react'
require 'sprockets/coffee-react-postprocessor'

if defined?(Rails)
  module Sprockets
    class CoffeeReact
      class Engine < ::Rails::Engine
        initializer :setup_coffee_react, :after => "sprockets.environment", :group => :all do |app|

          # ::Sprockets::CoffeeReact.install(app.assets)

          # unless app.assets.engines['.coffee']
          #   if defined?(Sprockets::CoffeeScriptTemplate)
          #     app.assets.register_engine '.coffee', Sprockets::CoffeeScriptTemplate
          #     else
          #     app.assets.register_engine '.coffee', Tilt::CoffeeScriptTemplate
          #   end
          # end
          
          # app.assets.register_preprocessor '.coffee', Sprockets::CoffeeReact
          app.assets.register_preprocessor 'application/javascript', Sprockets::CoffeeReact
          app.assets.register_postprocessor 'application/javascript', Sprockets::CoffeeReactPostprocessor
          app.assets.register_engine '.cjsx', Sprockets::CoffeeReactScript
          app.assets.register_engine '.js.cjsx', Sprockets::CoffeeReactScript
        end
      end
    end
  end
end
