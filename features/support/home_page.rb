class HomePage
  include Capybara::DSL

  def visitGitHub
    visit('http://github.com')
    page.has_css?('.homepage')
  end

end