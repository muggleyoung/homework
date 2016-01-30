module Pages
  class Dashboard
    include Capybara::DSL

    def initialize
      @select_menu = '#dashboard div.select-menu'
    end

    def verify_user
      find(@select_menu).has_text?('dummymuggleyoung')
      puts 'User signed in GitHub...'
    end
  end
end