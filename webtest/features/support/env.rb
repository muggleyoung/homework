require 'pry'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'

require 'yaml'

Capybara.default_driver = :selenium

Before do |scenario|
  @home = Pages::Home.new
  @login_page = Pages::Login.new
  @dashboard = Pages::Dashboard.new
end

After do |scenario|
  Capybara.reset_sessions!
  if scenario.failed?
    puts "Scenario failed: #{scenario.inspect} | #{scenario.exception.message}"
  end
end