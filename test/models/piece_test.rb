require 'test_helper'

class PieceTest < ActiveSupport::TestCase

  setup do
    @game = Game.create(:user_id => 1)
    @game.populate_board
    @starting_pos = @game.piece_at(0,0)
    @king_range = [[0,0],[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],
                   [1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7],
                   [2,0],[2,1],[2,2],[2,3],[2,4],[2,5],[2,6],[2,7],
                   [3,0],[3,1],[3,2],                  [3,6],[3,7],
                   [4,0],[4,1],[4,2],                  [4,6],[4,7],
                   [5,0],[5,1],[5,2],                  [5,6],[5,7],
                   [6,0],[6,1],[6,2],[6,3],[6,4],[6,5],[6,6],[6,7],
                   [7,0],[7,1],[7,2],[7,3],[7,4],[7,5],[7,6],[7,7]]

    @white_pawn_range = [[0,0],[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],
                         [1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7],
                         [2,0],[2,1],[2,2],[2,3],[2,4],[2,5],[2,6],[2,7],
                         [3,0],[3,1],[3,2],[3,3],[3,4],[3,6],[3,6],[3,7],
                         [4,0],[4,1],[4,2],[4,3],      [4,5],[4,6],[4,7],
                         [5,0],[5,1],[5,2],                  [5,6],[5,7],
                         [6,0],[6,1],[6,2],[6,3],[6,4],[6,5],[6,6],[6,7],
                         [7,0],[7,1],[7,2],[7,3],[7,4],[7,5],[7,6],[7,7]]

    @black_pawn_range = [[0,0],[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],
                         [1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[1,7],
                         [2,0],[2,1],[2,2],[2,3],[2,4],[2,5],[2,6],[2,7],
                         [3,0],[3,1],[3,2],                  [3,6],[3,7],
                         [4,0],[4,1],[4,2],[4,3],      [4,5],[4,6],[4,7],
                         [5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6],[5,7],
                         [6,0],[6,1],[6,2],[6,3],[6,4],[6,5],[6,6],[6,7],
                         [7,0],[7,1],[7,2],[7,3],[7,4],[7,5],[7,6],[7,7]]


  @bishop_range = [      [0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],
                   [1,0],      [1,2],[1,3],[1,4],[1,5],[1,6],
                   [2,0],[2,1],      [2,3],[2,4],[2,5],      [2,7],
                   [3,0],[3,1],[3,2],      [3,4],      [3,6],[3,7],
                   [4,0],[4,1],[4,2],[4,3],      [4,5],[4,6],[4,7],
                   [5,0],[5,1],[5,2],      [5,4],     [5,6],[5,7],
                   [6,0],[6,1],      [6,3],[6,4],[6,5],     [6,7],
                   [7,0],      [7,2],[7,3],[7,4],[7,5],[7,6]      ]
  end
  test "move to an empty square" do
    start_pos = @game.piece_at(2,1)
    move_empty_square = @game.piece_at(2,1).move_to!(2,2)
    move_empty_square
    assert move_empty_square, "It fails if not empty"
    assert @game.piece_at(2,2).present?, "The piece is not present in the given position"
    assert @game.piece_at(2,1).nil?, "Piece is still in its position[empty_test]"
    assert_equal start_pos.id, @game.piece_at(2,2).id, "Not the same piece.id [enemy_test]"
  end

  test "move to an enemy square" do
    start_pos = @game.piece_at(5,5)
    rook = Rook.create(x_axis: 5, y_axis: 5, game_id: @game.id, color: "white")
    move_enemy_square = rook.move_to!(5,6)
    move_enemy_square
    assert move_enemy_square, "Return true only if enemy"
    assert @game.piece_at(5,6).present?, "The piece is not present in the given position"
    assert @game.piece_at(5,5).nil?, "Piece is still in its position[enemy_test]"
    assert_equal start_pos.id, @game.piece_at(5,6).id, "Not the same piece.id [enemy_test]"
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

  test "King move validation" do
    king_movement = [[5,3],[5,4],[5,5],[4,3],[4,5],[3,3],[3,4],[3,5]]
    king = King.create(x_axis: 4, y_axis: 4, game_id: @game.id)
    pawn = Pawn.create(x_axis: 4, y_axis: 5, game_id: @game.id)
    king_movement.each do |y,x|
      assert king.valid_move?([y,x]), "movement forbidden"
    end
    #see setup
    @king_range.each do |y,x|
      assert_not king.valid_move?([y,x]), "movement forbidden"
    end
  end

  test "[white]Pawn move validation" do
    pawn_movement = [[5,3],[5,4],[5,5]]
    pawn = Pawn.create(color: "white", x_axis: 4, y_axis: 4, game_id: @game.id)
    pawn_movement.each do |y,x|
      assert pawn.valid_move?([y,x]), "movement forbidden"
    end
    @white_pawn_range.each do |y,x|
      assert_not pawn.valid_move?([y,x]), "movement forbidden"
    end
  end

  test "[black]Pawn move validation" do
    pawn_movement = [[3,3],[3,4],[3,5]]
    pawn = Pawn.create(color: "black", x_axis: 4, y_axis: 4, game_id: @game.id)
    pawn_movement.each do |y,x|
      assert pawn.valid_move?([y,x]), "movement forbidden"
    end
    @black_pawn_range.each do |y,x|
      assert_not pawn.valid_move?([y,x]), "movement forbidden"
    end
  end

  test "Bishop move validation" do
    bishop_movement = [[3,3],[2,2],[3,5],[2,6],[5,5],[5,3]]
    bishop = Bishop.create(x_axis: 4, y_axis: 4, game_id: @game.id)
    pawn = Pawn.create(x_axis: 3, y_axis: 5, game_id: @game.id)
    assert_not bishop.valid_move?([6,2])
    pawn.destroy
    bishop_movement.each do |y,x|
      assert bishop.valid_move?([y,x]), "movement forbidden"
    end
    @bishop_range.each do |y,x|
      assert_not bishop.valid_move?([y,x]), "movement forbidden"
    end
  end
end
