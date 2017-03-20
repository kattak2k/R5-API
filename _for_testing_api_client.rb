
#rename this file to api_client_rb and execute the file to see the results
#run file using command: ruby api_client.rb
require 'faraday'

=begin
client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter  Faraday.default_adapter
end
 
response = client.post do |req|
  req.url '/api/v1/users'
  req.headers['Content-Type'] = 'application/json'
  req.body = '{ "user": {"name": "test user"} }'
end
=end

client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter  Faraday.default_adapter
  config.token_auth('6aec2bf713536425ac44b2e766419324')
end
 
response = client.post do |req|
  req.url '/api/v1/posts'
  req.headers['Content-Type'] = 'application/json'
  req.body = '{ "post": {"title": "Title", "body": "Text"} }'
end

response = client.delete do |req|
  req.url '/api/v1/posts/8'
  req.headers['Content-Type'] = 'application/json'
end

require 'oj'

puts Oj.load(response.body)
puts response.status

#output: {"id"=>8, "name"=>"test user", "token"=>"6aec2bf713536425ac44b2e766419324"}
#201



