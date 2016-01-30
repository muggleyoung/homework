class Users

  def initialize
    @users = YAML.load_file('features/support/user.yml')
  end

  def random_user
    @users.first
  end
end