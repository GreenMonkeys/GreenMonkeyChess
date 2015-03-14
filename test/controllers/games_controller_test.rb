require 'test_helper'

class GamesControllerTest < ActionController::TestCase

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

	test 'update_board' do
		game = Game.create(:user_id => 1)
   	game.populate_board
   	board = game.board
   	knight = board[0][1]

   	put :update_board, :id => game.id, :piece_id => knight.id, :y_axis => 2, :x_axis => 2, xhr: true

		knight_new = Piece.find(knight.id)
   	expected_coord = [2, 2]
   	actual_coord = [knight_new.y_axis, knight_new.x_axis]

   	assert_equal expected_coord, actual_coord
	end

end
