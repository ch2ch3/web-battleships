require 'sinatra/base'
require_relative 'game'

class Battleships < Sinatra::Base

	GAME = Game.new

	use Rack::MethodOverride

	enable :sessions
	set    :views, File.join(root, '..', 'views')
	set    :session_secret, 'disco'

	get '/' do
		erb :index
	end

	get '/new_game' do
		@player_one = session[:player_one_name]
		@player_two = session[:player_two_name]
		erb :new_game
	end

	post '/new_game/submit/player/:id' do |number|
		player_name = ("player_" + number + "_name").to_sym
		session[player_name] = params[:player]
		this_player = Player.new
		session[:player_id] = this_player.object_id
		GAME.players << Player.new
		redirect '/new_game'
	end

	delete '/new_game/reset' do
		session.clear
		#GAME.reset
		redirect '/'
	end

	get '/ship_placement' do
		GAME.set_up_boards
		@board = GAME.players[0].ship_board
		#@board = GAME.players.select {|player| player.object_id == session[:player_id]}.first.ship_board
		erb :ship_placement
	end

	# start the server if ruby file executed directly
	run! if app_file == $0
end
