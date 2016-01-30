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
      @users = YAML.load_file('features/support/user.yml')
      find(@username).set(@users[0]['username'])
      find(@password).set(@users[0]['password'])
      find(@sign_in).click
      puts 'User filled in credentials...'
    end
  end
end