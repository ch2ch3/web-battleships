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
		# @players = session[:game_players]
		@player_one = session[:player_one_name]
		@player_two = session[:player_two_name]
		erb :new_game
	end

	post '/new_game/submit/player/:id' do |number|
		player_name = ("player_" + number + "_name").to_sym
		session[player_name] = params[:player]
		this_player = Player.new
		session[:player_id] = this_player.object_id
		GAME.add_player(this_player)
		# session[:game_players] ||= []
		# session[:game_players] << this_player
		redirect '/new_game'
	end

	delete '/new_game/reset' do
		session.clear
		#GAME.reset
		redirect '/'
	end

	get '/ship_placement' do
		@players = GAME.players
		GAME.set_up_boards
		# below is not working at present because the players inside the cookie have not been updated when set_up_boards was called
		@board = @players.first.ship_board.grid
		erb :ship_placement
	end

	# start the server if ruby file executed directly
	run! if app_file == $0
end
