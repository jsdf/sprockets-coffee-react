$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sprockets-coffee-react"
  s.version     = "0.4.0"
  s.author      = "James Friend"
  s.email       = "james@jsdf.co"
  s.homepage    = "https://github.com/jsdf/sprockets-coffee-react"
  s.summary     = "Coffeescript with React JSX (CJSX) via Sprockets"
  s.description = <<-EOS
    Preprocessor for Coffeescript with React JSX (CJSX). 
    This gem makes it easy to integrate this into the Rails asset pipeline or other Sprockets chains.
    If you want to use CJSX without Sprockets, see the coffee-react gem, or the coffee-react npm module.
  EOS
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*"] + ["LICENSE", "Rakefile", "README.rdoc"]
  #s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency 'sprockets', '~> 2.1'
  s.add_runtime_dependency 'coffee-react', '~> 0.4', '>= 0.4.0'
end
