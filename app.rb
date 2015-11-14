require 'sinatra'
require 'tilt/erubis'

require 'pry'
require 'awesome_print'

ROOT = File.expand_path('app', File.dirname(__FILE__))

Dir.glob("#{ROOT}/**/*.rb").sort.each { |f| require f }

class Converter < Sinatra::Base
  set :views, "#{ROOT}/views"

  get '/' do
    erb :index
  end

  post '/' do
    @result = ChatConverter.convert(params[:from], params[:to], params[:content])
    erb :index
  end
end
