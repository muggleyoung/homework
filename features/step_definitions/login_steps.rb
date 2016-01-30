Given(/^I visit GitHub$/) do
  @home.visit_github
end

When(/^I log in with my credentials$/) do
  @login_page.visit
  @login_page.sign_in
end

Then(/^I should see welcome message on the page$/) do
  @dashboard.verify_user
end

