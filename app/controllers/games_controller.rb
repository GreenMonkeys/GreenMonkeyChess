class GamesController < ApplicationController

	def show
		@pieces = Piece.all
	end
end
