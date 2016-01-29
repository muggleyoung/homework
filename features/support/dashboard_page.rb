class DashboardPage
  include Capybara::DSL

  def verify_user
    find('#dashboard div.select-menu').has_text?('dummymuggleyoung')
    puts 'User signed in GitHub...'
  end

end