require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'rspec'
require 'pry'

Capybara.default_driver = :selenium

After do |scenario|
  Capybara.reset_sessions!
end