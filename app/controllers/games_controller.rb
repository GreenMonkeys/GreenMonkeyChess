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

		if @piece.y_axis == 0 || @piece.y_axis == 7
			redirect_to game_promote_select_path(:game_id => @game, :id => @piece)## TODO: promote page
		else
			redirect_to game_path(@game)
		end
	end

	def promote_select
		@game = Game.find(params[:game_id])
		@board = @game.board
		@piece = Piece.find(params[:id])
	end

	def promote_create
		@game = Game.find(params[:game_id])
		@piece = Piece.find(params[:id])
		@piece_promote = Piece.create(:color => @piece.image, :x_axis => @piece.x_axis, :y_axis => @piece.y_axis, :image => @piece.image_select(@piece.color, params[:type]), :game_id => @game.id, :type => params[:type])
		@piece.destroy
		redirect_to game_path(@game)
	end
	
end
