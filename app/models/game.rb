class Game < ActiveRecord::Base

 	has_and_belongs_to_many :users
	has_many :pieces
	belongs_to :user
  
  delegate :rooks, :knights, :bishops, :kings, :queens, to: :pieces

  def board
    return @board if @board.present?
    @board =  [[nil, nil, nil, nil,nil,nil,nil,nil],
               [nil, nil, nil, nil,nil,nil,nil,nil],
               [nil, nil, nil, nil,nil,nil,nil,nil],
               [nil, nil, nil, nil,nil,nil,nil,nil],
               [nil, nil, nil, nil,nil,nil,nil,nil],
               [nil, nil, nil, nil,nil,nil,nil,nil],
               [nil, nil, nil, nil,nil,nil,nil,nil],
               [nil, nil, nil, nil,nil,nil,nil,nil]]

  
  self.pieces.each do |p|
  x = p.x_axis
  y = p.y_axis
    @board[y][x] = p
  end
  return @board

  end
   
  def populate_board    
    self.board
    #white pieces
   #@board[y][x] <= IMPORTANT    
    @board[0][0] = Rook.create(:color => :white, :name => :rook, :position => "00", :x_axis => 0, :y_axis => 0)
    @board[0][1] = Knight.create(:color => :white, :name => :knight, :position => "10", :x_axis => 1, :y_axis => 0)
    @board[0][2] = Bishop.create(:color => :white, :name => :bishop, :position => "20", :x_axis => 2, :y_axis =>0)
    @board[0][3] = Queen.create(:color => :white, :name => :queen, :position => "30", :x_axis => 3, :y_axis => 0)
    @board[0][4] = King.create(:color => :white, :name => :king, :position => "40", :x_axis => 4, :y_axis => 0)
    @board[0][5] = Bishop.create(:color => :white, :name => :bishop, :position => "50", :x_axis => 5, :y_axis => 0)
    @board[0][6] = Knight.create(:color => :white, :name => :knight, :position => "60", :x_axis =>6, :y_axis => 0)
    @board[0][7] = Rook.create(:color => :white, :name => :rook, :position => "70", :x_axis => 7, :y_axis => 0)
    @board[1][0] = Pawn.create(:color => :white, :name => :pawn, :position => "01", :x_axis => 0, :y_axis => 1)
    @board[1][1] = Pawn.create(:color => :white, :name => :pawn, :position => "11", :x_axis => 1, :y_axis => 1)
    @board[1][2] = Pawn.create(:color => :white, :name => :pawn, :position => "21", :x_axis => 2, :y_axis => 1)
    @board[1][3] = Pawn.create(:color => :white, :name => :pawn, :position => "31", :x_axis => 3, :y_axis => 1)
    @board[1][4] = Pawn.create(:color => :white, :name => :pawn, :position => "41", :x_axis => 4, :y_axis => 1)
    @board[1][5] = Pawn.create(:color => :white, :name => :pawn, :position => "51", :x_axis => 5, :y_axis => 1)
    @board[1][6] = Pawn.create(:color => :white, :name => :pawn, :position => "61", :x_axis => 6, :y_axis => 1)
    @board[1][7] = Pawn.create(:color => :white, :name => :pawn, :position => "71", :x_axis => 7, :y_axis => 1)
  
  # #black pieces
    @board[7][0] = Rook.create(:color => :black, :name => :rook, :position => "07", :x_axis => 0, :y_axis => 7)
    @board[7][1] = Knight.create(:color => :black, :name => :knight, :position => "17", :x_axis => 1, :y_axis => 7)
    @board[7][2] = Bishop.create(:color => :black, :name => :bishop, :position => "27", :x_axis => 2, :y_axis => 7)
    @board[7][3] = Queen.create(:color => :black, :name => :queen, :position => "37", :x_axis => 3, :y_axis => 7)
    @board[7][4] = King.create(:color => :black, :name => :king, :position => "47", :x_axis => 4, :y_axis => 7)
    @board[7][5] = Bishop.create(:color => :black, :name => :bishop, :position => "57", :x_axis => 5, :y_axis => 7)
    @board[7][6] = Knight.create(:color => :black, :name => :knight, :position => "67", :x_axis => 6, :y_axis => 7)
    @board[7][7] = Rook.create(:color => :black, :name => :rook, :position => "77", :x_axis => 7, :y_axis => 7)
    @board[6][0] = Pawn.create(:color => :black, :name => :pawn, :position => "06", :x_axis => 0, :y_axis => 6)
    @board[6][1] = Pawn.create(:color => :black, :name => :pawn, :position => "16", :x_axis => 1, :y_axis => 6)
    @board[6][2] = Pawn.create(:color => :black, :name => :pawn, :position => "26", :x_axis => 2, :y_axis => 6)
    @board[6][3] = Pawn.create(:color => :black, :name => :pawn, :position => "36", :x_axis => 3, :y_axis => 6)
    @board[6][4] = Pawn.create(:color => :black, :name => :pawn, :position => "46", :x_axis => 4, :y_axis => 6)
    @board[6][5] = Pawn.create(:color => :black, :name => :pawn, :position => "56", :x_axis => 5, :y_axis => 6)
    @board[6][6] = Pawn.create(:color => :black, :name => :pawn, :position => "66", :x_axis => 6, :y_axis => 6)
    @board[6][7] = Pawn.create(:color => :black, :name => :pawn, :position => "76", :x_axis => 7, :y_axis => 6)

    #Piece.all

   self.pieces << Piece.all
   @board
  end


end
