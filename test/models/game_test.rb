require 'test_helper'

class GameTest < ActiveSupport::TestCase
 test "The first row is populated" do
   
   #NOTE: This test fails when the method .type is called even though the output should be the same.
         #In this case the test raise the failure: No visible difference in the Array#inspect output.
         #You should look at the implementation of #== on Array or its members.

    game = Game.create(:user_id => 1)
       
    expected =  [Rook.new(:color => :white, :name => :rook, :position => [0,0]).type,
                Knight.new(:color => :white, :name => :knight, :position => [0,1]).type,
                Bishop.new(:color => :white, :name => :bishop, :position => [0,2]).type,
                Queen.new(:color => :white, :name => :queen, :position => [0,3]).type,
                King.new(:color => :white, :name => :king, :position => [0,4]).type,
                Bishop.new(:color => :white, :name => :bishop, :position => [0,5]).type,
                Knight.new(:color => :white, :name => :knight, :position => [0,6]).type,
                Rook.new(:color => :white, :name => :rook, :position =>[0,7]).type]
                # Pawn.new(:color => :white, :name => :pawn, :position => [1,0]),
                # Pawn.new(:color => :white, :name => :pawn, :position => [1,1]),
                # Pawn.new(:color => :white, :name => :pawn, :position => [1,2]),
                # Pawn.new(:color => :white, :name => :pawn, :position => [1,3]),
                # Pawn.new(:color => :white, :name => :pawn, :position => [1,4]),
                # Pawn.new(:color => :white, :name => :pawn, :position => [1,5]),
                # Pawn.new(:color => :white, :name => :pawn, :position => [1,6]),
                # Pawn.new(:color => :white, :name => :pawn, :position => [1,7])
                
      
    actual = []
    game.populate_board[0].each do |x|
                actual << x.type
              end
                
              

    assert_equal expected, actual
  end
end
