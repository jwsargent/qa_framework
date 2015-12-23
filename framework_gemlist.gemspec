# A sample Gemfile
# source "https://rubygems.org"
'ruby 2.1.8'

Gem::Specification.new do |gem|
  gem.name        = 'framework_gemlist'
  gem.authors     = 'JW Sargent'
  gem.email       = 'jsargent@tonicdesign.com'
  gem.date        = '2015-12-22'
  gem.version     = '0.0.0'

  gem.summary     = 'Includes all files and gems for QA framework'
  gem.description = 'Houses gem dependencies for QA framework'
  gem.files       = "tools/config.rb"

  # gem.homepage  =

  gem.add_dependency 'rest-client', '1.8.0'
  gem.add_dependency 'capybara', '2.5.0'
  gem.add_dependency 'capybara/poltergeist', '1.8.1'
  gem.add_dependency 'capybara/rspec', '3.4.0'
  gem.add_dependency 'selenium-webdriver', '2.48.1'
  gem.add_dependency 'json', '1.8.1'
  gem.add_dependency 'pry', '0.10.3'
  gem.add_dependency 'capybara-screenshot', '1.0.11'
end
