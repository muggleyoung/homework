require 'faraday'
require 'pry'
require 'json'
require 'json-schema'

describe 'users' do

  before(:each) do
    connection = Faraday.new(:url => 'https://api.github.com', :headers => {'Accept' => 'application/vnd.github.v3+json'}) do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end

    @response = connection.get do |req|
      req.url '/users/muggleyoung'
    end
    @json = JSON.parse(@response.body)
  end

  it 'should return success when request for existing user' do
    expect(@json['login']).to eql('muggleyoung')
    expect(@response).to be_success
  end

  it 'should return required user information' do
    expect(JSON::Validator.validate('spec/user.json', @json)).to be_truthy
  end

end