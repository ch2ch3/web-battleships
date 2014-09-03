require 'sinatra/base'

class Battleships < Sinatra::Base

	set :views, 'views/'

  	get '/' do
		erb :index
  	end

	get '/new_game' do
		erb :new_game
	end

  post '/new_game' do
		@player_one = params[:player_one]
    @player_two = params[:player_two]
    erb :new_game
  end
  
  	# start the server if ruby file executed directly
  	run! if app_file == $0
end
