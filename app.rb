require 'sinatra'

class Converter < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @result = params[:content]
    erb :index
  end
end
