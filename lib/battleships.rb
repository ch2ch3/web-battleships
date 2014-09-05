require 'sinatra/base'
require_relative 'game'

class Battleships < Sinatra::Base

	GAMES = []
	PLAYERS = []

	use Rack::MethodOverride

	enable :sessions
	set    :views, File.join(root, '..', 'views')
	set    :public_folder, File.join(root, '..', 'public')
	set    :session_secret, 'disco'

	get '/' do
		@player = PLAYERS.detect {|player| player.object_id == session[:id]}
		@players = PLAYERS
		erb :index
	end

	get '/new_game' do
		erb :new_game
	end

	post '/submit/player' do
		player = Player.new(params[:player_name])
		PLAYERS << player
		session[:id] = player.object_id
		redirect '/'
	end

	delete '/new_game/reset' do
		session.clear
		redirect '/'
	end

	get '/ship_placement' do
		erb :ship_placement
	end

	# start the server if ruby file executed directly
	run! if app_file == $0
end
