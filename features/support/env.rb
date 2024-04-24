require 'cucumber/rails'
require 'webdrivers'

require 'simplecov'
require 'simplecov_json_formatter'
SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter
SimpleCov.start 'rails'

# require 'rspec' #for page.shoud etc
require 'capybara/cucumber'
require 'cucumber'
require 'pry'
require "selenium-webdriver"

require 'database_cleaner'


if Rails.configuration.use_remote_webdriver
  # Ask capybara to register a driver called 'selenium'
  Capybara.register_driver :selenium do |app|
    options = Selenium::WebDriver::Firefox::Options.new
    options.add_argument('--headless')
    Capybara::Selenium::Driver.new(
        app,

        #what browser do we want? Must match whatever is in our seleniarm stand-alone image
        browser: :firefox, 
        options: options
        #where does it live? By passing a URL we tell capybara to use a selenium grid instance (not local)
        #url: "http://#{ENV['SELENIUM_HOST']}:#{ENV['SELENIUM_PORT']}" 
    )
  end

  # make the driver we just registered our default driver
  Capybara.default_driver = :selenium
  # Capybara.javascript_driver = :selenium

  # set the default URL for our tests
  #Capybara.server_host = "0.0.0.0"
  Capybara.server_host = "127.0.0.1"
  #Capybara.server_port = ENV['RAILS_PORT']
  Capybara.server_port = "3000"
  Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
else
  # Capybara.default_driver = :selenium_chrome
  # Capybara.default_driver = :selenium
  # Selenium::WebDriver::Chrome::Service.executable_path = '/Users/quanqihu/Desktop/Fall_2023/csce606/project/NXTFolio/chromedriver-mac-arm64' # specify the path of chromedriver
  # driver = webdriver.Chrome(executable_path='C:/path/to/chromedriver.exe')
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome, :executable_path => '/Users/user/Documents/chromedriver-mac-x64')
  end
end



# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

# frozen_string_literal: true

# frozen_string_literal: true

# frozen_string_literal: true

# Capybara defaults to CSS3 selectors rather than XPath.
# If you'd prefer to use XPath, just uncomment this line and adjust any
# selectors in your step definitions to use the XPath syntax.
# Capybara.default_selector = :xpath

# By default, any exception happening in your Rails application will bubble up
# to Cucumber so that your scenario will fail. This is a different from how
# your application behaves in the production environment, where an error page will
# be rendered instead.
#
# Sometimes we want to override this default behaviour and allow Rails to rescue
# exceptions and display an error page (just like when the app is running in production).
# Typical scenarios where you want to do this is when you test your error pages.
# There are two ways to allow Rails to rescue exceptions:
#
# 1) Tag your scenario (or feature) with @allow-rescue
#
# 2) Set the value below to true. Beware that doing this globally is not
# recommended as it will mask a lot of errors for you!
#
ActionController::Base.allow_rescue = false

# Remove/comment out the lines below if your app doesn't have a database.
# For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
#begin
  #DatabaseCleaner.strategy = :transaction
  #DatabaseCleaner.strategy = :truncation
#rescue NameError
  #raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
#end


DatabaseCleaner.strategy = :truncation

Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end


# You may also want to configure DatabaseCleaner to use different strategies for certain features and scenarios.
# See the DatabaseCleaner documentation for details. Example:
#
#   Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
#     # { except: [:widgets] } may not do what you expect here
#     # as Cucumber::Rails::Database.javascript_strategy overrides
#     # this setting.
#     DatabaseCleaner.strategy = :truncation
#   end
#
#   Before('not @no-txn', 'not @selenium', 'not @culerity', 'not @celerity', 'not @javascript') do
#     DatabaseCleaner.strategy = :transaction
#   end
#

# Possible values are :truncation and :transaction
# The :transaction strategy is faster, but might give you threading problems.
# See https://github.com/cucumber/cucumber-rails/blob/master/features/choose_javascript_database_strategy.feature
Cucumber::Rails::Database.javascript_strategy = :truncation
