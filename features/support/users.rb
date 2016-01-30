class Users

  def initialize
    @users = YAML.load_file('features/support/user.yml')
  end

  def random_user
    user = @users.first
    OpenStruct.new(email: user['email'],password: user['password'])
  end
end