module Pages
  class Home < Base

    def initialize
      @homepage = '.homepage'
    end

    def visit_github
      visit('http://github.com')
      expect(page).to have_css(@homepage)
    end
  end
end