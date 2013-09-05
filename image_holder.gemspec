$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "image_holder/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "image_holder"
  s.version     = ImageHolder::VERSION
  s.authors     = ["Suraj Pratap"]
  s.email       = ["suraj.pratap24@gmail.com"]
  s.homepage    = "https://github.com/surajpratap"
  s.summary     = "Image uploading and managing solution for rails."
  s.description = "Upload image, resize, documentize with model name, without hassel."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.0"
  s.add_dependency 'rmagick'

  s.add_development_dependency "sqlite3"
end
