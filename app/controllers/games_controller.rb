class GamesController < ApplicationController

	def show
		@game = Game.find(params[:id])
		
		# used to initialize board
	    # @board = @game.populate_board

    @board = @game.board
	end

	def update
		@game = Game.find(params[:id])
		@piece = Piece.find(params[:id])
		@piece.update_attributes(:x_axis => params[:x_axis], :y_axis => params[:y_axis])
	end

end
