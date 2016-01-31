module Pages
  class Dashboard < Base

    def initialize
      @select_menu = '#dashboard div.select-menu'
    end

    def verify_user
      expect(find(@select_menu)).to have_text('dummymuggleyoung')
      puts 'User signed in GitHub...'
    end
  end
end