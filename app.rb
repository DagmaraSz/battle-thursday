require 'sinatra/base'
require 'player'

class Battle < Sinatra::Base
  enable :sessions

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
    $Player1.attack($Player2)
    erb :p1_attack
  end

  run! if app_file == $0
end
