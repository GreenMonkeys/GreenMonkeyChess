require 'test_helper'

class GameTest < ActiveSupport::TestCase
 test "Board is populated" do
   
    game = Game.create(:user_id => 1)
       
    expected =   @board = [["00","10","20","30","40","50","60","70"],                                                                              
                           ["01","11","21","31","41","51","61","71"],                                                              
                           ["02","12","22","32","42","52","62","72"],                  
                           ["03","13","23","33","43","53","63","73"],
                           ["04","14","24","34","44","54","64","74"],
                           ["05","15","25","35","45","55","65","75"],
                           ["06","16","26","36","46","56","66","76"],
                           ["07","17","27","37","47","57","67","77"]].flatten
               
                
      
    actual =  []  
   
    game.populate_board.each do |x|
      x.each do |y|
        if y.is_a? String
          actual << y
          else
          actual << y.position 
        end
      end
    end


    assert_equal expected, actual
  end
end
