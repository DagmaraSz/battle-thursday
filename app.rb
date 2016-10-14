require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class Battle < Sinatra::Base

  if ENV['RACK_ENV'] == 'test'
    disable :show_exceptions
  end

  before '/' do
    Game.create(Player.new, Player.new)
  end

  before do
    @game = Game.game
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    @game.player1.set_name(params[:player_one])
    @game.player2.set_name(params[:player_two])
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  post "/attack" do
    @game.set_current_player(params[:player])
    @game.attack(@game.players[1], params[:attack_type])
    redirect '/play'
  end

  run! if app_file == $0
end
