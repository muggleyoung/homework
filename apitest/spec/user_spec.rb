require 'faraday'
require 'pry'
require 'json'
require 'json-schema'
require 'faraday_middleware'

describe 'users' do
  before do
    @connection = Faraday.new(url: 'https://api.github.com', headers: {'Accept' => 'application/vnd.github.v3+json'}) do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.response :json, content_type: /\bjson$/
    end
  end

  it 'should return success when request for existing user' do
    response = @connection.get '/users/muggleyoung'
    expect(response).to be_success
    expect(response.body['login']).to eql('muggleyoung')
  end

  it 'should return required user information' do
    response = @connection.get '/users/muggleyoung'
    expect(JSON::Validator.validate('spec/schemas/user.json', response.body)).to be_truthy
  end

  it 'should return not found when request for invalid user' do
    response = @connection.get '/users/muggleyoung1'
    expect(response.status).to eq(404)
  end

end