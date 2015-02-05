require 'test_helper'

class GameTest < ActiveSupport::TestCase
 test "The first row is populated" do
   
   #NOTE: This test fails when the method .type is called even though the output should be the same.
         #In this case the test raise the failure: No visible difference in the Array#inspect output.
         #You should look at the implementation of #== on Array or its members.

    game = Game.create(:user_id => 1)
       
    expected =  game.populate_board[0][0] = Rook.new(:white, :rook, [0,0]),
                game.populate_board[0][1] = Knight.new(:white, :knight, [0,1]),
                game.populate_board[0][2] = Bishop.new(:white, :bishop, [0,2]),
                game.populate_board[0][3] = Queen.new(:white, :queen, [0,3]),
                game.populate_board[0][4] = King.new(:white, :king, [0,4]),
                game.populate_board[0][5] = Bishop.new(:white, :bishop, [0,5]),
                game.populate_board[0][6] = Knight.new(:white, :knight, [0,6]),
                game.populate_board[0][7] = Rook.new(:white, :rook, [0,7])
      
    actual = game.populate_board[0].each {|x| puts x }
    
    assert_equal expected, actual
  end
end
