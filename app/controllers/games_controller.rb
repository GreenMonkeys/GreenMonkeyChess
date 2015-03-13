class GamesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :delete]

	def index
		@games = Game.where(:opponent_id => nil)
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
	#current_user.games.create(game_params)
	@game = Game.new(game_params)
	@game.user_id = current_user.id
	@game.save
    redirect_to game_path(@game)
    #need to redirect this to the board once it's been made

	end

	def update
		@game = Game.find(params[:id])
		@game.opponent_id = current_user.id
		@game.save
		redirect_to game_path(@game)
	end

	def edit
		@game = Game.find(params[:id])
	end

	def destroy
		@game = Game.find(params[:id])
  		@game.destroy
  		redirect_to games_path
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
		redirect_to game_path(@game)
	end

private

	def game_params
		params.require(:game).permit(:name)
	end

end
