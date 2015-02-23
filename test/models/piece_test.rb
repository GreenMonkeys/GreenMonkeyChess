require 'test_helper'

class PieceTest < ActiveSupport::TestCase
  
  test "Knight move validation" do
    game = Game.create(user_id: 1)
    game.populate_board
    knight = game.knights.where(color: :white).sample
    test1 = knight.valid_move?([knight.y_axis+2,knight.x_axis+1])
    test2 = knight.valid_move?([knight.y_axis+2,knight.x_axis])
    exception = assert_raise(RuntimeError) { knight.valid_move?([knight.y_axis-2,knight.x_axis-2]) }
    assert test1
    assert_not test2
    assert_equal "this move is not within the board", exception.message
  end

  test "Queen move validation" do
    game = Game.create(user_id: 1)
    game.populate_board
    queen = game.queens.where(color: :white).sample
    pawn = game.pawns.where(color: :white, x_axis: 3).sample
    exception = assert_raise(RuntimeError) { queen.valid_move?([queen.y_axis-1,queen.x_axis]) }
    test1 = queen.valid_move?([queen.y_axis+5,queen.x_axis])
    pawn.destroy
    test2 = queen.valid_move?([queen.y_axis+5,queen.x_axis])
    queen.update_attributes(y_axis: queen.y_axis+5)
    test3 = queen.valid_move?([queen.y_axis,queen.x_axis-3])
    test4 = queen.valid_move?([queen.y_axis-3,queen.x_axis-3])
    test5 = queen.valid_move?([queen.y_axis-3,queen.x_axis-2])
    assert_equal "this move is not within the board", exception.message
    assert_not test1
    assert test2
    assert test3
    assert test4
    assert_not test5
  end

  test "Rook move validation" do
    game = Game.create(user_id: 1)
    game.populate_board
    rook = game.rooks.where(color: :white, x_axis: 7).sample
    pawn = game.pawns.where(color: :white, x_axis: 7).sample
    exception = assert_raise(RuntimeError) { rook.valid_move?([rook.y_axis-1,rook.x_axis]) }
    test1 = rook.valid_move?([rook.y_axis+4,rook.x_axis])
    pawn.destroy
    test2 = rook.valid_move?([rook.y_axis+4,rook.x_axis])
    rook.update_attributes(y_axis: rook.y_axis+4)
    test3 = rook.valid_move?([rook.y_axis,rook.x_axis-4])
    test4 = rook.valid_move?([rook.y_axis-2,rook.x_axis-2])
    assert_equal "this move is not within the board", exception.message
    assert_not test1
    assert test2
    assert test3
    assert_not test4
  end

end
