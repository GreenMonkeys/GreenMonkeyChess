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
		@piece_promote = Piece.create(:color => @piece.image, :x_axis => @piece.x_axis, :y_axis => @piece.y_axis, :image => @piece.image_select(@piece.color, params[:type]), :game_id => @game.id)
		@piece.destroy
		redirect_to game_path(@game)
	end
	
	private

	def game_params
		params.require(:game).permit(:name)
	end
end
