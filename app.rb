require 'sinatra'
require 'tilt/erubis'
require 'logger'

require 'pry'
require 'awesome_print'

ROOT = File.expand_path('app', File.dirname(__FILE__))

Dir.glob("#{ROOT}/**/*.rb").sort.each { |f| require f }

class Converter < Sinatra::Base
  set :views, "#{ROOT}/views"

  configure do
    $logger = Logger.new(STDOUT)
  end

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
