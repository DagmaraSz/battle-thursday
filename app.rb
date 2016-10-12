require 'sinatra/base'

class Battle < Sinatra::Base


  get '/' do
    erb(:index)
  end

  post '/play' do
    @player_one = params[:player_one]
    @player_two = params[:player_two]
    erb(:play)
  end



  run! if app_file == $0
end
