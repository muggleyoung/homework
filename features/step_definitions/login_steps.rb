Given(/^I visit GitHub$/) do
  home = HomePage.new
  home.visitGitHub
end

When(/^I log in with my credentials$/) do
  login_page = LoginPage.new
  login_page.visit
  login_page.sign_in
end

Then(/^I should see welcome message on the page$/) do
  dashboard = DashboardPage.new
  dashboard.verify_user
end

