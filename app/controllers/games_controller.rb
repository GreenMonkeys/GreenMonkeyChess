class GamesController < ApplicationController

	def show
		@game = Game.find(params[:id])
		
		# used to initialize board
	    # @board = @game.populate_board

    @board = @game.board
	end

	def update
		@piece = Piece.find(params[:piece_id])
		@piece.move_to!(params[:x_axis].to_i, params[:y_axis].to_i)
		render :nothing => true
	end

end
