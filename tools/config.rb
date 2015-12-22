require 'capybara'
require 'rspec'
require 'capybara/poltergeist'
# Set 'chrome=true' in terminal to run test using Selenium with Chrome
  Capybara.register_driver :chrome do |app|
    options = {
      js_errors: false,
      timeout: 30,
      debug: false,
      inspector: false
    }
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end
# Set 'firefox=true' in terminal to run test using Selenium with Firefox
  Capybara.register_driver :firefox do |app|
    options = {
      js_errors: false,
      timeout: 30,
      debug: false,
      inspector: false
    }
    Capybara::Selenium::Driver.new(app, browser: :firefox)
  end
# Set 'safari=true' in terminal to run test using Selenium with safari
  Capybara.register_driver :safari do |app|
    options = {
      js_errors: false,
      timeout: 30,
      debug: false,
      inspector: false
    }
    Capybara::Selenium::Driver.new(app, browser: :safari)
  end
# Set 'ie=true' in terminal to runtest using Selenium with IE
  # Capybara.register_driver = :ie do |app|
  #   options = {
  #     js_errors: false,
  #     timeout: 30,
  #     debug: false,
  #     inspector: false
  #   }
  #   Capybara::Selenium::Driver.new(app, browser: :ie)
  # end
# Set 'headless=true' in terminal to run test using Poltergeist (headless chrome like emulation)
  # Capybara.default_driver = :poltergeist
  # Capybara.javascript_driver = :poltergeist
  Capybara.register_driver :poltergeist do |app|
    options = {
      window_size: [1024, 640], #1920 1080
      js_errors: false,
      phantomjs_logger: StringIO.new,
      timeout: 180,
      debug: false,
      phantomjs_options: ['--load-images=yes', '--ignore-ssl-errors=true', '--ssl-protocol=any', '--web-security=false'],
      inspector: false
    }
    Capybara::Poltergeist::Driver.new(app, options)
  end
# Capybara config
# Capybara.configure do |config|
#   config.ignore_hidden_elements = true
#   config.match = :prefer_exact
#   # config.app_host = url
#   config.default_max_wait_time = 30
#   config.run_server = true
# end
# if %w( chrome firefox ie safari ).include? ENV['DRIVER']
#   page.driver.browser.manage.window.maximize
# end
