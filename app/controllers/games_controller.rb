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
		@piece.update_attributes(:x_axis => params[:x_axis], :y_axis => params[:y_axis])

		if @game.pieces.kings.checked?(self.current_position)
			render html: "<strong>King Checked</strong>".html_safe
			if King.check_mate?
				render html: "<strong>Checkmate</strong".html_safe
			else
				redirect_to game_path(@game)
			end
		else
			redirect_to game_path(@game)
		end
	end

end
