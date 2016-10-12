require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class Battle < Sinatra::Base
  enable :sessions

  p "Hello3"
  if ENV['RACK_ENV'] == 'test'
    disable :show_exceptions
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    $Player1 = Player.new(params[:player_one])
    $Player2 = Player.new(params[:player_two])
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  get "/p1_attack" do
    @game = Game.new
    @game.attack($Player2)
    erb :p1_attack
  end

  run! if app_file == $0
end
