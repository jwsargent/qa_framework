require 'rest-client'
require 'capybara'
require 'capybara/poltergeist'
require 'capybara/rspec'
require 'selenium/webdriver'
require 'rspec'
require 'json'
require '../tools/config.rb'
require 'pry'
# require './gemfile.gemspec'


include RSpec::Expectations
include Capybara::DSL
# driver = Selenium::WebDriver.for :chrome
# driver = Capybara.default_driver = :poltergeist

Capybara.default_driver = ENV['DRIVER'].to_sym
if %w( chrome firefox ie safari ).include? ENV['DRIVER']
  page.driver.browser.manage.window.maximize
end

begin


  # nav_to_page
  visit 'http://www.tonicdesign.com'
  find('.caseStudyLink')
  puts 'case study'
  # find_element(:class, 'caseStudyLink').click
  sleep 2
  binding.pry
  within('.clear', visible: true) do
    find('.clear').click
  end
  puts 'close'
  # find_element(:class, 'close').click
  sleep 3
  find('.watch').click
  # find_element(:class, 'watch').click
  puts 'Video Plays'
  sleep 5
  find('.coverUp').click
  # find_element(:class, 'coverUp').click

  puts 'Test Complete'
  quit
  # navigate.to

end
