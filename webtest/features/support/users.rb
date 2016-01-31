class Users

  def initialize
    @users = YAML.load_file('features/support/schema/user.yml')
  end

  def random_user
    user = @users.first
    OpenStruct.new(email: user['email'],password: user['password'])
  end

  def invalid_user
    OpenStruct.new(email: 'invalid',password: 'password')
  end
end