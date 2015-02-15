class Game < ActiveRecord::Base
 	has_and_belongs_to_many :users
	has_many :pieces
  
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
    @board[0][0] = Rook.create(:color => :white, :name => :rook, :x_axis => 0, :y_axis => 0, :game_id => self.id)
    @board[0][1] = Knight.create(:color => :white, :name => :knight, :x_axis => 1, :y_axis => 0, :game_id => self.id)
    @board[0][2] = Bishop.create(:color => :white, :name => :bishop, :x_axis => 2, :y_axis =>0, :game_id => self.id)
    @board[0][3] = Queen.create(:color => :white, :name => :queen, :x_axis => 3, :y_axis => 0, :game_id => self.id)
    @board[0][4] = King.create(:color => :white, :name => :king, :x_axis => 4, :y_axis => 0, :game_id => self.id)
    @board[0][5] = Bishop.create(:color => :white, :name => :bishop, :x_axis => 5, :y_axis => 0, :game_id => self.id)
    @board[0][6] = Knight.create(:color => :white, :name => :knight, :x_axis =>6, :y_axis => 0, :game_id => self.id)
    @board[0][7] = Rook.create(:color => :white, :name => :rook, :x_axis => 7, :y_axis => 0, :game_id => self.id)
    @board[1][0] = Pawn.create(:color => :white, :name => :pawn, :x_axis => 0, :y_axis => 1, :game_id => self.id)
    @board[1][1] = Pawn.create(:color => :white, :name => :pawn, :x_axis => 1, :y_axis => 1, :game_id => self.id)
    @board[1][2] = Pawn.create(:color => :white, :name => :pawn, :x_axis => 2, :y_axis => 1, :game_id => self.id)
    @board[1][3] = Pawn.create(:color => :white, :name => :pawn, :x_axis => 3, :y_axis => 1, :game_id => self.id)
    @board[1][4] = Pawn.create(:color => :white, :name => :pawn, :x_axis => 4, :y_axis => 1, :game_id => self.id)
    @board[1][5] = Pawn.create(:color => :white, :name => :pawn, :x_axis => 5, :y_axis => 1, :game_id => self.id)
    @board[1][6] = Pawn.create(:color => :white, :name => :pawn, :x_axis => 6, :y_axis => 1, :game_id => self.id)
    @board[1][7] = Pawn.create(:color => :white, :name => :pawn, :x_axis => 7, :y_axis => 1, :game_id => self.id)
  
  # #black pieces
    @board[7][0] = Rook.create(:color => :black, :name => :rook, :x_axis => 0, :y_axis => 7, :game_id => self.id)
    @board[7][1] = Knight.create(:color => :black, :name => :knight, :x_axis => 1, :y_axis => 7, :game_id => self.id)
    @board[7][2] = Bishop.create(:color => :black, :name => :bishop, :x_axis => 2, :y_axis => 7, :game_id => self.id)
    @board[7][3] = Queen.create(:color => :black, :name => :queen, :x_axis => 3, :y_axis => 7, :game_id => self.id)
    @board[7][4] = King.create(:color => :black, :name => :king, :x_axis => 4, :y_axis => 7, :game_id => self.id)
    @board[7][5] = Bishop.create(:color => :black, :name => :bishop, :x_axis => 5, :y_axis => 7, :game_id => self.id)
    @board[7][6] = Knight.create(:color => :black, :name => :knight, :x_axis => 6, :y_axis => 7, :game_id => self.id)
    @board[7][7] = Rook.create(:color => :black, :name => :rook, :x_axis => 7, :y_axis => 7, :game_id => self.id)
    @board[6][0] = Pawn.create(:color => :black, :name => :pawn, :x_axis => 0, :y_axis => 6, :game_id => self.id)
    @board[6][1] = Pawn.create(:color => :black, :name => :pawn, :x_axis => 1, :y_axis => 6, :game_id => self.id)
    @board[6][2] = Pawn.create(:color => :black, :name => :pawn, :x_axis => 2, :y_axis => 6, :game_id => self.id)
    @board[6][3] = Pawn.create(:color => :black, :name => :pawn, :x_axis => 3, :y_axis => 6, :game_id => self.id)
    @board[6][4] = Pawn.create(:color => :black, :name => :pawn, :x_axis => 4, :y_axis => 6, :game_id => self.id)
    @board[6][5] = Pawn.create(:color => :black, :name => :pawn, :x_axis => 5, :y_axis => 6, :game_id => self.id)
    @board[6][6] = Pawn.create(:color => :black, :name => :pawn, :x_axis => 6, :y_axis => 6, :game_id => self.id)
    @board[6][7] = Pawn.create(:color => :black, :name => :pawn, :x_axis => 7, :y_axis => 6, :game_id => self.id)

    #Piece.all

   
   @board
  end

end
