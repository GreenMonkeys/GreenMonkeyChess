class GamesController < ApplicationController

	def show
		@game = Game.find(params[:id])
		
		# used to initialize board
	    # @board = @game.populate_board

    @board = @game.board
	end

	def update
		@game = Game.find(params[:id])
		@piece = Piece.find(params[:piece_id])
		@piece.update_attributes(:y_axis => params[:y_axis], :x_axis => params[:x_axis])
		render :nothing => true
	end

end
