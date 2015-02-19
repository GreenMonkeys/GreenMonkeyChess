require 'test_helper'

class GameTest < ActiveSupport::TestCase
 
  setup do
    @game = Game.create(:user_id => 1)
  end
 
  test "Initial board position" do
    expected = [[:rook, :knight, :bishop, :queen, :king, :bishop, :knight, :rook],
                [:pawn, :pawn, :pawn, :pawn, :pawn, :pawn, :pawn, :pawn],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil, nil],
                [:pawn, :pawn, :pawn, :pawn, :pawn, :pawn, :pawn, :pawn],
                [:rook, :knight, :bishop, :queen, :king, :bishop, :knight, :rook]].flatten
               
                
      
    actual =  []  
   
    @game.populate_board.each do |x|
      x.each do |y|
        if y.nil?
          actual << y
          else
          actual << y.name 
        end
      end
    end


    assert_equal expected, actual
  end
end
