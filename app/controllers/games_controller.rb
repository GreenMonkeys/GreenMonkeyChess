class GamesController < ApplicationController

	def index
		@games = Game.all
	end

	def show
		@game = Game.find(params[:id])
		
		# used to initialize board
	    # @board = @game.populate_board

	    @board = @game.board
	end

	def new
		@game = Game.new
	end

	def create

    Game.create(game_params)
    redirect_to games_path
    #need to redirect this to the board once it's been made
	end

private

	def game_params
		params.require(:game).permit(:name)
	end

end
