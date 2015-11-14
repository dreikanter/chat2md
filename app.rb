require 'sinatra'
require 'tilt/erb'

ROOT = File.expand_path('app', File.dirname(__FILE__))

Dir.glob("#{ROOT}/**/*.rb").sort.each { |f| require f }

class Converter < Sinatra::Base
  set :views, "#{ROOT}/views"

  get '/' do
    erb :index
  end

  post '/' do
    @from = params[:from]
    @to = params[:to]
    @result = ChatConverter.convert(@from, @to, params[:content])
    erb :index
  end
end
