require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'
require 'iex-ruby-client'
require 'erb'

get '/' do
  get_summary
end

get '/signup' do
#  a = "This is the signup page!"
#  a
  name = "Whatznear";
  ERB.new("<h1>Hello ERB World!! </h1><h3><%= name %></h3>").result(binding)
end

get '/lastpage?' do
#  "Now, this is the last page! #{params[:name]}"
  erb :layout
end


def get_summary
  api_publishable = "SENSITIVE DATA"
  api_secret_key = "SENSITIVE DATA" 
  
#  IEX::Api.configure do |config|
#    config.publishable_token = api_publishable # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
#    config.secret_token = api_secret_key # defaults to ENV['IEX_API_SECRET_TOKEN']
#    config.endpoint = 'https://sandbox.iexapis.com/v1' 
    #'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
    
    client = IEX::Api::Client.new(
      publishable_token: 'SENSITIVE DATA',
      secret_token: 'SENSITIVE DATA',
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    client.get('ZNGA') rescue nil
#    news = client.news('MSFT',5)
#    puts news
#    news
    quote = client.quote('ZNGA')
    puts quote
    quote.to_json
    ERB.new("<h3><%= quote.to_json %></h3>").result(binding)
#    quote2 = client.quote('TSLA')
#    puts quote2
#    quote2.to_s
end
