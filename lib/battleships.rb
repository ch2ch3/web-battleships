require 'sinatra/base'

class Battleships < Sinatra::Base

	use Rack::MethodOverride

	enable :sessions
	set    :views, File.join(root, '..', 'views')
	set    :session_secret, 'disco'

  	get '/' do
		erb :index
  	end

	get '/new_game' do
		@player_one = session[:player_one]
		@player_two = session[:player_two]
		erb :new_game
	end

  	post '/new_game/submit/player/:id' do |id|
		player_id = ("player_" + id).to_sym
		session[player_id] = params[:player]
		redirect '/new_game'
  	end

	delete '/new_game/reset' do
		session.delete(:player_one)
		session.delete(:player_two)
		redirect '/'
	end

	get '/ship_placement' do
		erb :ship_placement
	end

  	# start the server if ruby file executed directly
  	run! if app_file == $0
end
