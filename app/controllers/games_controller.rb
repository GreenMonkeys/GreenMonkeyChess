class GamesController < ApplicationController

	def show
		@game = Game.find(params[:id])

		# used to initialize board
	    # @board = @game.populate_board

	    @board = @game.board
	end

	def select
		@game = Game.find(params[:game_id])
		@board = @game.board
		@piece = Piece.find(params[:id])
	end

	def piece_update
		@game = Game.find(params[:game_id])
		@piece = Piece.find(params[:id])
		@piece.move_to!(params[:x_axis], params[:y_axis])
		redirect_to game_path(@game)
	end

end
