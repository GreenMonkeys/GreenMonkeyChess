require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end


 	test 'show_board' do
	  	game = Game.create(:user_id => 1)
	   	board = game.populate_board

	   	get :show, :id => game.id
	   	assert_response :success
  	end

 	test 'select_piece' do
	  	game = Game.create(:user_id => 1)
	   	game.populate_board
	   	board = game.board

	   	get :select, :game_id => game.id, :id => board[1][0].id
	
		assert_response :success
	end

	test 'piece_update' do
		game = Game.create(:user_id => 1)
	   	game.populate_board
	   	board = game.board
	   	pawn = board[1][0]

	   	put :piece_update, :game_id => game.id, :id => pawn.id, :y_axis => 3, :x_axis => 0

 		pawn_moved = Piece.find(pawn.id)
	   	expected_coord = [3, 0]
	   	actual_coord = [pawn_moved.y_axis, pawn_moved.x_axis]

	   	assert_equal expected_coord, actual_coord
	end

end
