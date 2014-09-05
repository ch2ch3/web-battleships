require 'sinatra/base'
require_relative 'game'

class Battleships < Sinatra::Base

	GAME = Game.new

	use Rack::MethodOverride

	enable :sessions
	set    :views, File.join(root, '..', 'views')
	set    :public_folder, File.join(root, '..', 'public')
	set    :session_secret, 'disco'

	get '/' do
		GAME.reset
		erb :index
	end

	get '/new_game' do
		erb :new_game
	end

	post '/new_game/submit/player/:id' do |number|
		this_player = Player.new(params[:player])
		session[:player_id] = this_player.object_id
		GAME.add_player(this_player)
		redirect '/new_game'
	end

	delete '/new_game/reset' do
		session.clear
		GAME.reset
		redirect '/'
	end

	get '/ship_placement' do
		GAME.set_up_boards
		@board = GAME.current_player.ship_board.grid
		erb :ship_placement
	end

	# start the server if ruby file executed directly
	run! if app_file == $0
end
