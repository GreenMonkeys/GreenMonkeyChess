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

		if :y_axis == 0 || 7
			@piece.update_attributes(:x_axis => params[:x_axis], :y_axis => params[:y_axis])
			redirect_to game_promote_select_path(@game)## TODO: promote page
		else
			@piece.update_attributes(:x_axis => params[:x_axis], :y_axis => params[:y_axis])
			redirect_to game_path(@game)
		end
	end

	def promote_select
		@game = Game.find(params[:game_id])
		@board = @game.board
		@piece = Piece.find(params[:id])
	end

	def promote_update
		@game = Game.find(params[:game_id])
		@piece = Piece.find(params[:id])
		@piece.update_attributes(:type => params[:type], :image=> params[:image])
	end
end
