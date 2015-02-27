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

  test "Knight move validation" do
    game = Game.create(user_id: 1)
    game.populate_board
    knight = game.knights.where(color: :white).sample
    test1 = knight.valid_move?([knight.y_axis+2,knight.x_axis+1])
    test2 = knight.valid_move?([knight.y_axis+2,knight.x_axis])
    exception1 = assert_raise(RuntimeError) { knight.valid_move?([knight.y_axis-2,knight.x_axis-2]) }
    assert test1
    assert_not test2
    assert_equal "this move is not within the board", exception1.message

  end

  test "Queen move validation" do
    game = Game.create(user_id: 1)
    game.populate_board
    queen = game.queens.where(color: :white).sample
    pawn = game.pawns.where(color: :white, x_axis: 3).sample
    exception1 = assert_raise(RuntimeError) { queen.valid_move?([queen.y_axis+3,queen.x_axis+3]) }
    exception2 = assert_raise(RuntimeError) { queen.valid_move?([queen.y_axis-1,queen.x_axis]) }
    pawn.destroy
    test1 = queen.valid_move?([queen.y_axis+5,queen.x_axis])
    queen.update_attributes(y_axis: queen.y_axis+5)
    test2 = queen.valid_move?([queen.y_axis,queen.x_axis-3])
    test3 = queen.valid_move?([queen.y_axis-3,queen.x_axis-3])
    test4 = queen.valid_move?([queen.y_axis-3,queen.x_axis-2])
    assert_equal "this move is obstructed", exception1.message
    assert_equal "this move is not within the board", exception2.message
    assert test1
    assert test2
    assert test3
    assert_not test4
  end

  test "Rook move validation" do
    game = Game.create(user_id: 1)
    game.populate_board
    rook = game.rooks.where(color: :white, x_axis: 7).sample
    pawn = game.pawns.where(color: :white, x_axis: 7).sample
    exception1 = assert_raise(RuntimeError) { rook.valid_move?([rook.y_axis+4,rook.x_axis]) }
    exception2 = assert_raise(RuntimeError) { rook.valid_move?([rook.y_axis-1,rook.x_axis]) }
    pawn.destroy
    test1 = rook.valid_move?([rook.y_axis+4,rook.x_axis])
    rook.update_attributes(y_axis: rook.y_axis+4)
    test2 = rook.valid_move?([rook.y_axis,rook.x_axis-4])
    test3 = rook.valid_move?([rook.y_axis-2,rook.x_axis-2])
    assert_equal "this move is obstructed", exception1.message
    assert_equal "this move is not within the board", exception2.message
    assert test1
    assert test2
    assert_not test3
  end

end
