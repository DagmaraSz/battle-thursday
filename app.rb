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
    erb(:play)
  end

  post "/attack" do
    $game.set_current_player(params[:player])
    $game.attack($game.players[1])
    redirect '/play'
  end

  run! if app_file == $0
end
