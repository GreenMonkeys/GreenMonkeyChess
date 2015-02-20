class GamesController < ApplicationController

	def show
		@game = Game.find(params[:id])
		
		# used to initialize board
	    # @board = @game.populate_board

	    @board = @game.board
	end

	def select
	end

end
