require 'test_helper'

class GameTest < ActiveSupport::TestCase
 
  setup do
    @game = Game.create(:user_id => 1)
  end
 
  test "Initial board position" do
    expected = [["Rook", "Knight", "Bishop", "Queen", "King", "Bishop", "Knight", "Rook"],
                ["Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn"],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                ["Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn"],
                ["Rook", "Knight", "Bishop", "Queen", "King", "Bishop", "Knight", "Rook"]].flatten
               
                
      
    actual =  []  
   
    @game.populate_board.each do |x|
      x.each do |y|
        if y.nil?
          actual << y
          else
          actual << y.type 
        end
      end
    end


    assert_equal expected, actual
  end
end
