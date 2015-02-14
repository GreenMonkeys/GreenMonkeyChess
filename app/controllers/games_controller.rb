class GamesController < ApplicationController

	def show
		@game = Game.find(params[:id])
		@board = @game.populate_board
	end

end
