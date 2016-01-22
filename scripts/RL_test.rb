require 'rest-client'
require 'capybara'
require 'capybara/poltergeist'
require 'capybara/rspec'
require 'selenium/webdriver'
require 'rspec'
require 'json'
require './tools/config.rb'
require './tools/RL_functions.rb'
require 'pry'
require 'fastimage'
# require '/framework_gemlist.gemspec'


include RSpec::Expectations
include Capybara::DSL

Capybara.default_driver = ENV['DRIVER'].to_sym
if %w( chrome firefox ie safari ).include? ENV['DRIVER']
  page.driver.browser.manage.window.resize_to(940, 1200)
end

begin
  start = Time.now

# ENTER SCRIPT BELOW
  visit 'http://localhost:8000/#/product/23322676?_k=c5wkkt' #blue shirt
  # visit 'http://localhost:8000/#/product/2994541?_k=b2we51' #big pony
  # visit 'http://localhost:8000/#/product/23029676?_k=vqy9dx' #pillows
  # visit 'http://localhost:8000/#/product/57579296?_k=6mbg1p' #baby shirt
  # visit 'http://localhost:8000/#/product/3175072' #flag template
  # page.driver.browser.manage.window.resize_to(640, 1200)
  # verify_accordion_titles
  # test_639_breakpoint
  # test_940_breakpoint

  binding.pry
  verify_first_accordion_open


rescue SystemExit, Interrupt
  puts '----Test Cancelled---- Duration: ' + (Time.now - start).to_s
ensure
  puts '----TEST COMPLETE---- Duration: ' + (Time.now - start).to_s
  save_screenshot('end_screenshot.png')
end
