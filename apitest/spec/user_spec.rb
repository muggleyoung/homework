require 'faraday'
require 'pry'
require 'json'
require 'json-schema'

describe 'users' do

  it 'should return user information' do
    conn = Faraday.new(:url => 'https://api.github.com', :headers => {'Accept' => 'application/vnd.github.v3+json'}) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get do |req|                           # GET http://sushi.com/search?page=2&limit=100
      req.url '/users/muggleyoung'
    end

    json = JSON.parse(response.body)
    expect(response).to be_success

    schema = {
        'type' => 'object',
        'required' => %w(login id repos_url public_repos),
        'properties' => {
            'login' => {'type' => 'string'},
            'id' => {'type' => 'integer'},
            'repos_url' => {'type' => 'string'},
            'public_repos' => {'type' => 'integer'}
        }
    }

    expect(JSON::Validator.validate(schema, json)).to be_truthy
  end

end