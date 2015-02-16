class GamesController < ApplicationController
before_action :authenticate_user!
	def index
		@games = Game.all
	end

	def new
		@game = Game.new
	end

	def create

 #   @game.initialize_the_board!
 #   redirect_to game_path(@game)
	end
end
