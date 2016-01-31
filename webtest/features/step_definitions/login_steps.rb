Given(/^I visit GitHub$/) do
  @home.visit_github
end

When(/^I log in with my credentials$/) do
  user = Users.new.random_user
  @login_page.visit
  @login_page.sign_in(user)
end

Then(/^I should see my dashboard$/) do
  @dashboard.verify_user
end

When(/^I log in with invalid credentials$/) do
  user = Users.new.invalid_user
  @login_page.visit
  @login_page.sign_in(user)
end

Then(/^I should see an error message on the page$/) do
  @login_page.verify_error
end