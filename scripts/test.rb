require 'rest-client'
require 'capybara'
require 'capybara/poltergeist'
require 'capybara/rspec'
require 'selenium/webdriver'
require 'rspec'
require 'json'
require './tools/config.rb'
require 'pry'
require './tools/tonic_functions.rb'
# require '/framework_gemlist.gemspec'


include RSpec::Expectations
include Capybara::DSL

Capybara.default_driver = ENV['DRIVER'].to_sym
if %w( chrome firefox ie safari ).include? ENV['DRIVER']
  page.driver.browser.manage.window.maximize
end

begin
  start = Time.now

# ENTER SCRIPT BELOW
  visit 'http://www.tonicdesign.com'
  nav_to_case_study
  quit
  # navigate.to

rescue SystemExit, Interrupt
  puts '----Test Cancelled---- Duration: ' + (Time.now - start).to_s
ensure
  puts '----TEST COMPLETE---- Duration: ' + (Time.now - start).to_s
  save_screenshot('end_screenshot.png')
end
