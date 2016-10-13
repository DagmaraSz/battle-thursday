require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class Battle < Sinatra::Base
  enable :sessions

  if ENV['RACK_ENV'] == 'test'
    disable :show_exceptions
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player_one]), Player.new(params[:player_two]))
    redirect '/play'
  end

  get '/play' do
    $game.switch if params[:switch] == "true"
    erb(:play)
  end

  get "/p1_attack" do
    $game.attack($game.players[1])
    erb :p1_attack
  end

  run! if app_file == $0
end
