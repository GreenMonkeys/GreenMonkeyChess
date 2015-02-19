require 'test_helper'

class PieceTest < ActiveSupport::TestCase

   game = Game.create(:user_id => 1)
   game.populate_board
	 starting_pos = game.piece_at(0,0)
  test "move to an empty square" do
    move_empty_square = game.piece_at(0,0).move_to!(0,2) if game.piece_at(0,2).nil?
    assert move_empty_square, "It fails if not empty"
    assert game.piece_at(0,0).nil?, "Piece is still in its position[empty_test]"
    assert_equal starting_pos, game.piece_at(0,2), "The piece hasn't moved"
       
  end

  test "move to an enemy square" do
    move_enemy_square = game.piece_at(0,0).move_to!(7,7) if game.piece_at(7,7).color != game.piece_at(0,0).color
    assert move_enemy_square, "Return true only if enemy"
    assert game.piece_at(0,0).nil?, "Piece is still in its positiond[enemy_test]"
    assert_equal starting_pos, game.piece_at(7,7), "The piece hasn't moved"
  end

  test "not move to an allied square" do
    move_allied_square = game.piece_at(0,0).move_to!(1,0) if starting_pos.color == game.piece_at(1,0).color
    assert_not move_allied_square, "It fails if allied square"
    assert_not_nil starting_pos, "Piece has moved [allied_test]"
  end
end
