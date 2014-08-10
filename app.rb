require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'
require 'mecab/light'

get '/ping' do
  content_type :json
  'pong'.to_json
end

def part_of_speech(node)
  node.feature.split(',').first
end

get '/parse/:input' do |input|
  @tagger ||= MeCab::Light::Tagger.new('')

  content_type :json
  values = @tagger.parse(input).map do |node|
    {surface: node.surface, part_of_speech: part_of_speech(node)}
  end
  {parsed: values}.to_json
end

