require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'
require 'mecab/heavy'

get '/ping' do
  content_type :json
  'pong'.to_json
end
