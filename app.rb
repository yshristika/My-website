require 'sinatra'
require 'unirest'
require 'json'

get '/' do
  get_summary
end

get '/signup' do
  "This is the signup page!"
end

get '/lastpage?' do
  obj1 = { name: "John", age: 30, city: "New York" };
  pp = JSON.parse(obj1)
  pp  
  "Now, this is the last page! #{params[:name]}"
end


def get_summary
  api_host = "apidojo-yahoo-finance-v1.p.rapidapi.com"
  api_key = "d93c51f075msh16c29b914414250p1b54e2jsndebd89d52c47" 

  region = "US"
  lang = "end"
  response = Unirest.get "https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/get-summary?region=#{region}&lang=#{lang}",
    headers:{
      "X-RapidAPI-Host" => api_host,
      "X-RapidAPI-Key" => api_key
    },
  parameters:{
    "parameter" => "value"
  }
#  response.raw_body # Unparsed body
#  puts response.code
#  puts response.headers
#  puts response.body
  pp =  response.body['marketSummaryResponse']['result']
   pp.each do |i|
     "Exchange Name = " i["fullExchangeName"] 
   end
#  puts pp
#  pp
end