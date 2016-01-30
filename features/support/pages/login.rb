module Pages
  class Login
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
      user = Users.new.random_user
      find(@username).set(user['username'])
      find(@password).set(user['password'])
      find(@sign_in).click
      puts 'User filled in credentials...'
    end
  end
end