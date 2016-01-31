module Pages
  class Login < Base

    def initialize
      @login = '#login'
      @username = '#login_field'
      @password = '#password'
      @sign_in = '.auth-form-body input.btn-primary'
      @error = '.flash-error'
    end

    def visit
      click_link('Sign in')
      expect(page).to have_css(@login)
      puts 'User landed on sign in page...'
    end

    def sign_in user
      find(@username).set(user.email)
      find(@password).set(user.password)
      find(@sign_in).click
      puts 'User filled in credentials...'
    end

    def verify_error
      expect(page).to have_css(@error)
    end

  end
end