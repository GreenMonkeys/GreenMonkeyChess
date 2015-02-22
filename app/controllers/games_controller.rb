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
		@game = current_user.games.create(game_params)
		if @game.valid?
			redirect_to games_path
		else
			render :new, :status => :unprocessable_entity
		end
	end


end
