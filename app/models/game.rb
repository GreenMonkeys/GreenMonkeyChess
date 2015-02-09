class Game < ActiveRecord::Base
 	has_and_belongs_to_many :users
	has_many :pieces

  

  def board
    @board = [["00","10","20","30","40","50","60","70"],                                                                              
              ["01","11","21","31","41","51","61","71"],                                                              
              ["02","12","22","32","42","52","62","72"],                  
              ["03","13","23","33","43","53","63","73"],
              ["04","14","24","34","44","54","64","74"],
              ["05","15","25","35","45","55","65","75"],
              ["06","16","26","36","46","56","66","76"],
              ["07","17","27","37","47","57","67","77"]]
  end
   
  def populate_board    
    self.board
    #white pieces
   #@board[y][x] <= IMPORTANT    
    @board[0][0] = Rook.create(:color => :white, :name => :rook, :position => @board[0][0], :x_axis => @board[0][0][0], :y_axis => @board[0][0][1])
    @board[0][1] = Knight.create(:color => :white, :name => :knight, :position => @board[0][1], :x_axis => @board[0][1][0], :y_axis => @board[0][1][1])
    @board[0][2] = Bishop.create(:color => :white, :name => :bishop, :position => @board[0][2], :x_axis => @board[0][2][0], :y_axis => @board[0][2][1])
    @board[0][3] = Queen.create(:color => :white, :name => :queen, :position => @board[0][3], :x_axis => @board[0][3][0], :y_axis => @board[0][3][1])
    @board[0][4] = King.create(:color => :white, :name => :king, :position => @board[0][4], :x_axis => @board[0][4][0], :y_axis => @board[0][4][1])
    @board[0][5] = Bishop.create(:color => :white, :name => :bishop, :position => @board[0][5], :x_axis => @board[0][5][0], :y_axis => @board[0][5][1])
    @board[0][6] = Knight.create(:color => :white, :name => :knight, :position => @board[0][6], :x_axis => @board[0][6][0], :y_axis => @board[0][6][1])
    @board[0][7] = Rook.create(:color => :white, :name => :rook, :position => @board[0][7], :x_axis => @board[0][7][0], :y_axis => @board[0][7][1])
    @board[1][0] = Pawn.create(:color => :white, :name => :pawn, :position => @board[1][0], :x_axis => @board[1][0][0], :y_axis => @board[1][0][1])
    @board[1][1] = Pawn.create(:color => :white, :name => :pawn, :position => @board[1][1], :x_axis => @board[1][1][0], :y_axis => @board[1][1][1])
    @board[1][2] = Pawn.create(:color => :white, :name => :pawn, :position => @board[1][2], :x_axis => @board[1][2][0], :y_axis => @board[1][2][1])
    @board[1][3] = Pawn.create(:color => :white, :name => :pawn, :position => @board[1][3], :x_axis => @board[1][3][0], :y_axis => @board[1][3][1])
    @board[1][4] = Pawn.create(:color => :white, :name => :pawn, :position => @board[1][4], :x_axis => @board[1][4][0], :y_axis => @board[1][4][1])
    @board[1][5] = Pawn.create(:color => :white, :name => :pawn, :position => @board[1][5], :x_axis => @board[1][5][0], :y_axis => @board[1][5][1])
    @board[1][6] = Pawn.create(:color => :white, :name => :pawn, :position => @board[1][6], :x_axis => @board[1][6][0], :y_axis => @board[1][6][1])
    @board[1][7] = Pawn.create(:color => :white, :name => :pawn, :position => @board[1][7], :x_axis => @board[1][7][0], :y_axis => @board[1][7][1])
  
  #black pieces
    @board[7][0] = Rook.create(:color => :black, :name => :rook, :position => @board[7][0], :x_axis => @board[7][0][0], :y_axis => @board[7][0][1] )
    @board[7][1] = Knight.create(:color => :black, :name => :knight, :position => @board[7][1], :x_axis => @board[7][1][0], :y_axis => @board[7][1][1])
    @board[7][2] = Bishop.create(:color => :black, :name => :bishop, :position => @board[7][2], :x_axis => @board[7][2][0], :y_axis => @board[7][2][1])
    @board[7][3] = Queen.create(:color => :black, :name => :queen, :position => @board[7][3], :x_axis => @board[7][3][0], :y_axis => @board[7][3][1])
    @board[7][4] = King.create(:color => :black, :name => :king, :position => @board[7][4], :x_axis => @board[7][4][0], :y_axis => @board[7][4][1])
    @board[7][5] = Bishop.create(:color => :black, :name => :bishop, :position => @board[7][5], :x_axis => @board[7][5][0], :y_axis => @board[7][5][1])
    @board[7][6] = Knight.create(:color => :black, :name => :knight, :position => @board[7][6], :x_axis => @board[7][6][0], :y_axis => @board[7][6][1])
    @board[7][7] = Rook.create(:color => :black, :name => :rook, :position => @board[7][7], :x_axis => @board[7][7][0], :y_axis => @board[7][7][1])
    @board[6][0] = Pawn.create(:color => :black, :name => :pawn, :position => @board[6][0], :x_axis => @board[6][0][0], :y_axis => @board[6][0][1])
    @board[6][1] = Pawn.create(:color => :black, :name => :pawn, :position => @board[6][1], :x_axis => @board[6][1][0], :y_axis => @board[6][1][1])
    @board[6][2] = Pawn.create(:color => :black, :name => :pawn, :position => @board[6][2], :x_axis => @board[6][2][0], :y_axis => @board[6][2][1])
    @board[6][3] = Pawn.create(:color => :black, :name => :pawn, :position => @board[6][3], :x_axis => @board[6][3][0], :y_axis => @board[6][3][1])
    @board[6][4] = Pawn.create(:color => :black, :name => :pawn, :position => @board[6][4], :x_axis => @board[6][4][0], :y_axis => @board[6][4][1])
    @board[6][5] = Pawn.create(:color => :black, :name => :pawn, :position => @board[6][5], :x_axis => @board[6][5][0], :y_axis => @board[6][5][1])
    @board[6][6] = Pawn.create(:color => :black, :name => :pawn, :position => @board[6][6], :x_axis => @board[6][6][0], :y_axis => @board[6][6][1])
    @board[6][7] = Pawn.create(:color => :black, :name => :pawn, :position => @board[6][7], :x_axis => @board[6][7][0], :y_axis => @board[6][7][1])

    #Piece.all

   self.pieces << Piece.all
   @board
  end

end
