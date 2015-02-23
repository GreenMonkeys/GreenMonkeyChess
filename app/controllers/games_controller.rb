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

    @game = Game.create(:opponent_id => new_opponent_id, :user_id => current_user.id)
    @game.initialize_the_board!
    redirect_to game_path(@game)
	end


end
