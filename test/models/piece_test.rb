require 'test_helper'

class PieceTest < ActiveSupport::TestCase

  setup do
    @game = Game.create(:user_id => 1)
    @game.populate_board
    @starting_pos = @game.piece_at(0,0)
  end
  
  test "move to an empty square" do
    move_empty_square = @game.piece_at(0,0).move_to!(0,2)
    move_empty_square
    assert move_empty_square, "It fails if not empty"
    assert @game.piece_at(0,2).present?, "The piece is not present in the given position"
    assert @game.piece_at(0,0).nil?, "Piece is still in its position[empty_test]"
    assert_equal @starting_pos.id, @game.piece_at(0,2).id, "Not the same piece.id [enemy_test]"
  end

  test "move to an enemy square" do
    move_enemy_square = @game.piece_at(0,0).move_to!(7,7)
    move_enemy_square
    assert move_enemy_square, "Return true only if enemy"
    assert @game.piece_at(7,7).present?, "The piece is not present in the given position"
    assert @starting_pos.present?, "Piece is still in its position[enemy_test]"
    assert_equal @starting_pos.id, @game.piece_at(7,7).id, "Not the same piece.id [enemy_test]"
  end

  test "not move to an allied square" do
    move_allied_square = @game.piece_at(0,0).move_to!(1,0)
    assert_not move_allied_square, "It fails if allied square"
    assert_equal @starting_pos.color, @game.piece_at(1,0).color, "[allied_test]"
    assert @game.piece_at(0,0).present?, "Piece has moved [allied_test]"
  end
end
