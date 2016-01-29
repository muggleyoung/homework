Given(/^I visit GitHub$/) do
  visit('http://github.com')
end

When(/^I log in with my credentials$/) do
  click_link('Sign in')
  page.should have_css('#login')
  find('#login_field').set('muggleyoung@mailinator.com')
  find('#password').set('muggle123')
  find('.auth-form-body input.btn-primary').click
end

Then(/^I should see welcome message on the page$/) do
  find('#dashboard div.select-menu').should have_text('dummymuggleyoung')
end

