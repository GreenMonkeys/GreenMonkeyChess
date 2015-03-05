# require 'test_helper'
#
# class GameTest < ActiveSupport::TestCase
#
#   setup do
#     @game = Game.create(:user_id => 1)
#   end
#
#   test "Initial board position" do
#     expected = [["Rook", "Knight", "Bishop", "Queen", "King", "Bishop", "Knight", "Rook"],
#                 ["Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn"],
#                 [nil, nil, nil, nil, nil, nil, nil, nil],
#                 [nil, nil, nil, nil, nil, nil, nil, nil],
#                 [nil, nil, nil, nil, nil, nil, nil, nil],
#                 [nil, nil, nil, nil, nil, nil, nil, nil],
#                 ["Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn"],
#                 ["Rook", "Knight", "Bishop", "Queen", "King", "Bishop", "Knight", "Rook"]].flatten
#
#
#
#     actual =  []
#
#     @game.populate_board.each do |x|
#       x.each do |y|
#         if y.nil?
#           actual << y
#           else
#           actual << y.type
#         end
#       end
#     end
#
#
#     assert_equal expected, actual
#   end
#
#   test "proposed diagonal move is obstructed" do
#     game = Game.create(:user_id => 1)
#     game.populate_board
#
#     # move Queen with the very first move of a game
#     test = game.is_obstructed?([3,0], [7,4])
#
#     assert test
#   end
#
#     test "proposed diagonal move is not obstructed" do
#     game = Game.create(:user_id => 1)
#     game.rooks.create!(:y_axis => 4, :x_axis => 5)
#     game.rooks.create!(:y_axis => 5, :x_axis => 4)
#
#
#     test = game.is_obstructed?([5,5], [3,3])
#
#     assert_not test
#   end
#
#   test "proposed horizontal move is obstructed" do
#     game = Game.create(:user_id => 1)
#     game.rooks.create!(:y_axis => 3, :x_axis => 4)
#     game.rooks.create!(:y_axis => 4, :x_axis => 4)
#
#
#     test = game.is_obstructed?([3,3], [3,5])
#
#     assert test
#   end
#
#   test "proposed horizontal move is not obstructed" do
#     game = Game.create(:user_id => 1)
#     game.rooks.create!(:y_axis => 4, :x_axis => 3)
#     game.rooks.create!(:y_axis => 4, :x_axis => 4)
#
#
#     test = game.is_obstructed?([3,5], [3,3])
#
#     assert_not test
#   end
#
#   test "proposed vertical move is obstructed" do
#     game = Game.create(:user_id => 1)
#     game.rooks.create!(:y_axis => 4, :x_axis => 3)
#
#
#     test = game.is_obstructed?([3,3], [6,3])
#
#     assert test
#   end
#
#   test "proposed vertical move is not obstructed" do
#     game = Game.create(:user_id => 1)
#     game.rooks.create!(:y_axis => 4, :x_axis => 4)
#
#
#     test = game.is_obstructed?([6,3], [3,3])
#
#     assert_not test
#   end
#
# end
