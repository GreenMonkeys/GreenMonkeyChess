require 'test_helper'

class GameTest < ActiveSupport::TestCase
 test "Initial board position" do
   
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

  test "proposed diagonal move is obstructed" do
    game = Game.create(:user_id => 1)
    game.populate_board

    # move Queen with the very first move of a game 
    test = game.is_obstructed([3,0], [7,4])

    assert test
  end

    test "proposed diagonal move is not obstructed" do
    game = Game.create(:user_id => 1)
    game.rooks.create!(:y_axis => 4, :x_axis => 5)
    game.rooks.create!(:y_axis => 5, :x_axis => 4)

    # move Pawn with the very first move of a game
    test = game.is_obstructed([3,3], [5,5])

    assert_not test
  end

  test "proposed horizontal move is obstructed" do
    game = Game.create(:user_id => 1)
    game.rooks.create!(:y_axis => 3, :x_axis => 4)

    # move Pawn with the very first move of a game
    test = game.is_obstructed([3,3], [3,5])

    assert test
  end

  test "proposed horizontal move is not obstructed" do
    game = Game.create(:user_id => 1)
    game.rooks.create!(:y_axis => 4, :x_axis => 4)

    # move Pawn with the very first move of a game
    test = game.is_obstructed([3,3], [3,5])

    assert_not test
  end

  test "proposed vertical move is obstructed" do
    game = Game.create(:user_id => 1)
    game.rooks.create!(:y_axis => 4, :x_axis => 3)

    # move Pawn with the very first move of a game
    test = game.is_obstructed([3,3], [5,3])

    assert test
  end

  test "proposed vertical move is not obstructed" do
    game = Game.create(:user_id => 1)
    game.rooks.create!(:y_axis => 4, :x_axis => 4)

    # move Pawn with the very first move of a game
    test = game.is_obstructed([3,3], [5,3])

    assert_not test
  end

end
