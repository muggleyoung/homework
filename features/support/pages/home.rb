module Pages
  class Home
    include Capybara::DSL

    def initialize
      @homepage = '.homepage'
    end

    def visit_github
      visit('http://github.com')
      page.has_css?(@homepage)
    end
  end
end