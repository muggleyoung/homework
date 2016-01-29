class LoginPage
  include Capybara::DSL

  def visit
    click_link('Sign in')
    page.has_css?('#login')
    puts 'User landed on sign in page...'
  end

  def sign_in
    find('#login_field').set('muggleyoung@mailinator.com')
    find('#password').set('muggle123')
    find('.auth-form-body input.btn-primary').click
    puts 'User filled in credentials...'
  end
end