class Game < ActiveRecord::Base
	has_many :users
	has_many :pieces

  #NOTE: the coordinates are [y][x] and not the usual [x][y]. So [0][0] is equivalent to row 1 column 1 (a1).

  def populate_board
    @board = @board = [[nil,nil,nil,nil,nil,nil,nil,nil],
                       [nil,nil,nil,nil,nil,nil,nil,nil],
                       [nil,nil,nil,nil,nil,nil,nil,nil],
                       [nil,nil,nil,nil,nil,nil,nil,nil],
                       [nil,nil,nil,nil,nil,nil,nil,nil],
                       [nil,nil,nil,nil,nil,nil,nil,nil],
                       [nil,nil,nil,nil,nil,nil,nil,nil],
                       [nil,nil,nil,nil,nil,nil,nil,nil]]
  #white pieces   
    @board[0][0] = Rook.new(:white, :rook, [0,0])
    @board[0][1] = Knight.new(:white, :knight, [0,1])
    @board[0][2] = Bishop.new(:white, :bishop, [0,2])
    @board[0][3] = Queen.new(:white, :queen, [0,3])
    @board[0][4] = King.new(:white, :king, [0,4])
    @board[0][5] = Bishop.new(:white, :bishop, [0,5])
    @board[0][6] = Knight.new(:white, :knight, [0,6])
    @board[0][7] = Rook.new(:white, :rook, [0,7])
    @board[1][0] = Pawn.new(:white, :pawn, [1,0])
    @board[1][1] = Pawn.new(:white, :pawn, [1,1])
    @board[1][2] = Pawn.new(:white, :pawn, [1,2])
    @board[1][3] = Pawn.new(:white, :pawn, [1,3])
    @board[1][4] = Pawn.new(:white, :pawn, [1,4])
    @board[1][5] = Pawn.new(:white, :pawn, [1,5])
    @board[1][6] = Pawn.new(:white, :pawn, [1,6])
    @board[1][7] = Pawn.new(:white, :pawn, [1,7])
  
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
    return @board
  end
end