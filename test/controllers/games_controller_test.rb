require 'test_helper'

class GamesControllerTest < ActionController::TestCase
   #test "the truth" do
   #  assert true
   #end

	test "index" do
	  FactoryGirl.create(:game)
	  get :index
	  assert_response :success
    end

    test "create not signed in" do
    	assert_no_difference 'Game.count' do
    		post :create, {:game => {
    			:name => 'tough game'
    			}
    		}
    	end
    	assert_redirected_to new_user_session_path
    end


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

	test 'pawn_promote' do
		game = Game.create(:user_id => 1)
	   	game.populate_board
	   	board = game.board
	   	pawn = board[1][0]

	   	put :piece_update, :game_id => game.id, :id => pawn.id, :y_axis => 7, :x_axis => 0
	

	   	post :promote_create, :game_id => game.id, :id => pawn.id, :type => 'Queen'

	   	pawn_promoted = Piece.where(:y_axis => board[7][0].y_axis, :x_axis => board[7][0].x_axis).first
	   	expected_type = 'Queen'
	   	actual_type = pawn_promoted.type

	   	assert_equal expected_type, actual_type
	end

end
