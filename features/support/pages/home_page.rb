class HomePage
  include Capybara::DSL

  def initialize
    @homepage = '.homepage'
  end

  def visitGitHub
    visit('http://github.com')
    page.has_css?(@homepage)
  end
end