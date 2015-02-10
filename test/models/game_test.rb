require 'test_helper'

class GameTest < ActiveSupport::TestCase
 test "Board is populated" do
   
    game = Game.create(:user_id => 1)
       
    expected = [["00", "10", "20", "30", "40", "50", "60", "70"],
                ["01", "11", "21", "31", "41", "51", "61", "71"],
                [nil, nil, nil, nil,nil,nil,nil,nil],
                [nil, nil, nil, nil,nil,nil,nil,nil],
                [nil, nil, nil, nil,nil,nil,nil,nil],
                [nil, nil, nil, nil,nil,nil,nil,nil],
                ["06", "16", "26", "36", "46", "56", "66", "76"],
                ["07", "17", "27", "37", "47", "57", "67", "77"]].flatten
               
                
      
    actual =  []  
   
    game.populate_board.each do |x|
      x.each do |y|
        if y.nil?
          actual << y
          else
          actual << y.position 
        end
      end
    end


    assert_equal expected, actual
  end
end
