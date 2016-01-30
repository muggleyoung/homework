require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'rspec'
require 'pry'

require 'yaml'

Capybara.default_driver = :selenium

Before do |scenario|
  @home = Pages::Home.new
  @login_page = Pages::Login.new
  @dashboard = Pages::Dashboard.new
end

After do |scenario|
  Capybara.reset_sessions!
end