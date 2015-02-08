class Game < ActiveRecord::Base
 	has_and_belongs_to_many :users
	has_many :pieces

  

  def populate_board
    @board = [[nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil]]
  #white pieces   
    @board[0][0] = Rook.new(:color => :white, :name => :rook, :position => [0,0])
    @board[0][1] = Knight.new(:color => :white, :name => :knight, :position => [0,1])
    @board[0][2] = Bishop.new(:color => :white, :name => :bishop, :position => [0,2])
    @board[0][3] = Queen.new(:color => :white, :name => :queen, :position => [0,3])
    @board[0][4] = King.new(:color => :white, :name => :king, :position => [0,4])
    @board[0][5] = Bishop.new(:color => :white, :name => :bishop, :position => [0,5])
    @board[0][6] = Knight.new(:color => :white, :name => :knight, :position => [0,6])
    @board[0][7] = Rook.new(:color => :white, :name => :rook, :position =>[0,7])
    @board[1][0] = Pawn.new(:color => :white, :name => :pawn, :position => [1,0])
    @board[1][1] = Pawn.new(:color => :white, :name => :pawn, :position => [1,1])
    @board[1][2] = Pawn.new(:color => :white, :name => :pawn, :position => [1,2])
    @board[1][3] = Pawn.new(:color => :white, :name => :pawn, :position => [1,3])
    @board[1][4] = Pawn.new(:color => :white, :name => :pawn, :position => [1,4])
    @board[1][5] = Pawn.new(:color => :white, :name => :pawn, :position => [1,5])
    @board[1][6] = Pawn.new(:color => :white, :name => :pawn, :position => [1,6])
    @board[1][7] = Pawn.new(:color => :white, :name => :pawn, :position => [1,7])
  
  #black pieces
     # @board[0][7] = Rook.new(:black, :rook, @board[7,0])
     # @board[1][7] = Knight.new(:black, :knight, @board[7,1])
     # @board[2][7] = Bishop.new(:black, :bishop, @board[7,2])
     # @board[3][7] = Queen.new(:black, :queen, @board[7,3])
     # @board[4][7] = King.new(:black, :king, @board[7,4])
     # @board[5][7] = Bishop.new(:black, :bishop, @board[7,5])
     # @board[6][7] = Knight.new(:black, :knight, @board[7,6])
     # @board[7][7] = Rook.new(:black, :rook, @board[7,7])
     # @board[0][6] = Pawn.new(:black, :pawn, @board[6,0])
     # @board[1][6] = Pawn.new(:black, :pawn, @board[6,1])
     # @board[2][6] = Pawn.new(:black, :pawn, @board[6,2])
     # @board[3][6] = Pawn.new(:black, :pawn, @board[6,3])
     # @board[4][6] = Pawn.new(:black, :pawn, @board[6,4])
     # @board[5][6] = Pawn.new(:black, :pawn, @board[6,5])
     # @board[6][6] = Pawn.new(:black, :pawn, @board[6,6])
     # @board[7][6] = Pawn.new(:black, :pawn, @board[6,7])

    @board

 
  end
end
