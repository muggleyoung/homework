class LoginPage
  include Capybara::DSL

  def initialize
    @login = '#login'
    @username = '#login_field'
    @password = '#password'
    @sign_in = '.auth-form-body input.btn-primary'
  end

  def visit
    click_link('Sign in')
    page.has_css?(@login)
    puts 'User landed on sign in page...'
  end

  def sign_in
    find(@username).set('muggleyoung@mailinator.com')
    find(@password).set('muggle123')
    find(@sign_in).click
    puts 'User filled in credentials...'
  end
end