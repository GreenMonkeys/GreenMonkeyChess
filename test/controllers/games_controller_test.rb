require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  
	test "proposed move is invalid" do
		game = Game.create(:user_id => 1)
		game.populate_board
		queen = game.pieces.where(type: 'Queen' && position: "30")

		# try to move Queen with the very first move of a game 
		expected = "not a valid move, there is a piece in the way"
		actual = game.move_piece(queen, "74")

		assert_equal expected, actual
	end

	test "proposed move to empty position is valid" do
		game = Game.create(:user_id => 1)
		game.populate_board
		pawn = game.pieces.where(type: 'Pawn' && position: "31")

		# try to move Pawn with the very first move of a game 
		expected = "33"
		game.move_piece(pawn, "33")

		assert_equal expected, pawn.position
	end

	test "proposed move to position occupied by opponent is valid" do
		game = Game.create(:user_id => 1)
		game.populate_board
		pawn = game.pieces.where(type: 'Pawn' && position: "21")
		queen = game.pieces.where(type: 'Queen' && position: "30")

		# move Pawn then Queen and try to take opponents Pawn!
		game.move_piece(pawn, "23")
		game.move_piece(queen, "03")
		game.move_piece(queen, "06")
		expected = "06"

		assert_equal expected, queen.position
	end

end
