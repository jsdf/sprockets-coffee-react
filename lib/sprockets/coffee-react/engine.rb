require 'sprockets/coffee-react'

if defined?(Rails)
  module Sprockets
    class CoffeeReact
      class Engine < ::Rails::Engine
        initializer :setup_coffee_react, :after => "sprockets.environment", :group => :all do |app|
          app.assets.register_preprocessor 'application/javascript', Sprockets::CoffeeReact
        end
      end
    end
  end
end
