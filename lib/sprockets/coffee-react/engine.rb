require 'sprockets'
require 'sprockets/coffee-react'

if defined?(Rails)
  module Sprockets
    class CoffeeReact
      class Engine < ::Rails::Engine
        initializer :setup_coffee_react, :after => "sprockets.environment", :group => :all do |app|
          app.assets.register_preprocessor 'application/javascript', Sprockets::CoffeeReact

          # unless app.assets.engines['.coffee']
          #   if defined?(Sprockets::CoffeeScriptTemplate)
          #     app.assets.register_engine '.coffee', Sprockets::CoffeeScriptTemplate
          #     else
          #     app.assets.register_engine '.coffee', Tilt::CoffeeScriptTemplate
          #   end
          # end
          
          # app.assets.register_preprocessor '.coffee', Sprockets::CoffeeReact
          app.assets.register_engine '.cjsx', Sprockets::CoffeeReactScript
          app.assets.register_engine '.js.cjsx', Sprockets::CoffeeReactScript
        end
      end
    end
  end
end
