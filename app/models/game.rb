class Game < ActiveRecord::Base
 	has_and_belongs_to_many :users
	has_many :pieces

  delegate :rooks, :knights, :bishops, :kings, :queens, :pawns, to: :pieces

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
    @board[0][0] = Rook.create(:color => :white, :x_axis => 0, :y_axis => 0, :image => 'white-rook.gif', :game_id => self.id)
    @board[0][1] = Knight.create(:color => :white, :x_axis => 1, :y_axis => 0, :image => 'white-knight.gif', :game_id => self.id)
    @board[0][2] = Bishop.create(:color => :white, :x_axis => 2, :y_axis =>0, :image => 'white-bishop.gif', :game_id => self.id)
    @board[0][3] = Queen.create(:color => :white, :x_axis => 3, :y_axis => 0, :image => 'white-queen.gif', :game_id => self.id)
    @board[0][4] = King.create(:color => :white, :x_axis => 4, :y_axis => 0, :image => 'white-king.gif', :game_id => self.id)
    @board[0][5] = Bishop.create(:color => :white, :x_axis => 5, :y_axis => 0, :image => 'white-bishop.gif', :game_id => self.id)
    @board[0][6] = Knight.create(:color => :white, :x_axis =>6, :y_axis => 0, :image => 'white-knight.gif', :game_id => self.id)
    @board[0][7] = Rook.create(:color => :white, :x_axis => 7, :y_axis => 0, :image => 'white-rook.gif', :game_id => self.id)
    @board[1][0] = Pawn.create(:color => :white, :x_axis => 0, :y_axis => 1, :image => 'white-pawn.gif', :game_id => self.id)
    @board[1][1] = Pawn.create(:color => :white, :x_axis => 1, :y_axis => 1, :image => 'white-pawn.gif', :game_id => self.id)
    @board[1][2] = Pawn.create(:color => :white, :x_axis => 2, :y_axis => 1, :image => 'white-pawn.gif', :game_id => self.id)
    @board[1][3] = Pawn.create(:color => :white, :x_axis => 3, :y_axis => 1, :image => 'white-pawn.gif', :game_id => self.id)
    @board[1][4] = Pawn.create(:color => :white, :x_axis => 4, :y_axis => 1, :image => 'white-pawn.gif', :game_id => self.id)
    @board[1][5] = Pawn.create(:color => :white, :x_axis => 5, :y_axis => 1, :image => 'white-pawn.gif', :game_id => self.id)
    @board[1][6] = Pawn.create(:color => :white, :x_axis => 6, :y_axis => 1, :image => 'white-pawn.gif', :game_id => self.id)
    @board[1][7] = Pawn.create(:color => :white, :x_axis => 7, :y_axis => 1, :image => 'white-pawn.gif', :game_id => self.id)

  # #black pieces
    @board[7][0] = Rook.create(:color => :black, :x_axis => 0, :y_axis => 7, :image => 'black-rook.gif', :game_id => self.id)
    @board[7][1] = Knight.create(:color => :black, :x_axis => 1, :y_axis => 7, :image => 'black-knight.gif', :game_id => self.id)
    @board[7][2] = Bishop.create(:color => :black, :x_axis => 2, :y_axis => 7, :image => 'black-bishop.gif', :game_id => self.id)
    @board[7][3] = Queen.create(:color => :black, :x_axis => 3, :y_axis => 7, :image => 'black-queen.gif', :game_id => self.id)
    @board[7][4] = King.create(:color => :black, :x_axis => 4, :y_axis => 7, :image => 'black-king.gif', :game_id => self.id)
    @board[7][5] = Bishop.create(:color => :black, :x_axis => 5, :y_axis => 7, :image => 'black-bishop.gif', :game_id => self.id)
    @board[7][6] = Knight.create(:color => :black,  :x_axis => 6, :y_axis => 7, :image => 'black-knight.gif', :game_id => self.id)
    @board[7][7] = Rook.create(:color => :black, :x_axis => 7, :y_axis => 7, :image => 'black-rook.gif', :game_id => self.id)
    @board[6][0] = Pawn.create(:color => :black, :x_axis => 0, :y_axis => 6, :image => 'black-pawn.gif', :game_id => self.id)
    @board[6][1] = Pawn.create(:color => :black, :x_axis => 1, :y_axis => 6, :image => 'black-pawn.gif', :game_id => self.id)
    @board[6][2] = Pawn.create(:color => :black, :x_axis => 2, :y_axis => 6, :image => 'black-pawn.gif', :game_id => self.id)
    @board[6][3] = Pawn.create(:color => :black, :x_axis => 3, :y_axis => 6, :image => 'black-pawn.gif', :game_id => self.id)
    @board[6][4] = Pawn.create(:color => :black, :x_axis => 4, :y_axis => 6, :image => 'black-pawn.gif', :game_id => self.id)
    @board[6][5] = Pawn.create(:color => :black, :x_axis => 5, :y_axis => 6, :image => 'black-pawn.gif', :game_id => self.id)
    @board[6][6] = Pawn.create(:color => :black, :x_axis => 6, :y_axis => 6, :image => 'black-pawn.gif', :game_id => self.id)
    @board[6][7] = Pawn.create(:color => :black, :x_axis => 7, :y_axis => 6, :image => 'black-pawn.gif', :game_id => self.id)

   @board
  end

  def is_obstructed?(position_1, position_2) # check if proposed move is obstructed

    # get begin and end coords from position
    begin_y = position_1[0]
    end_y = position_2[0]
    begin_x = position_1[1]
    end_x = position_2[1]
    delta_y = end_y - begin_y
    delta_x = end_x - begin_x

    # set range variables
    end_y >= begin_y ? (y_range = (begin_y..end_y).to_a) : (y_range = (begin_y.downto(end_y)).to_a)
    end_x >= begin_x ? (x_range = (begin_x..end_x).to_a) : (x_range = (begin_x.downto(end_x)).to_a)

    # check if proposed move is diagonal
    (delta_y != 0 && delta_x != 0 && delta_y.abs == delta_x.abs) ? (diag_move = true) : (diag_move = false)

    # loop through coords along proposed path and check if empty
    # ignore begin and end coords
    y_range.each do |y|
      x_range.each do |x|
        next if [y,x] == position_1 || [y,x] == position_2 || (diag_move && (y - begin_y).abs != (x - begin_x).abs)
        # go to next x if loop is at current or proposed position or is not along diagonal
        return true unless self.pieces.where(y_axis: y, x_axis: x).empty?
      end
    end
    return false
  end

  def piece_at(target_x_axis, target_y_axis)#destination of piece
   self.pieces.where(:x_axis => target_x_axis, :y_axis => target_y_axis).first
  end

 def find_path(position_1, position_2) # check if proposed move is obstructed
    path = []
    # get begin and end coords from position
    begin_y = position_1[0]
    end_y = position_2[0]
    begin_x = position_1[1]
    end_x = position_2[1]
    delta_y = end_y - begin_y
    delta_x = end_x - begin_x

    # set range variables
    end_y >= begin_y ? (y_range = (begin_y..end_y).to_a) : (y_range = (begin_y.downto(end_y)).to_a)
    end_x >= begin_x ? (x_range = (begin_x..end_x).to_a) : (x_range = (begin_x.downto(end_x)).to_a)

    # check if proposed move is diagonal
    (delta_y != 0 && delta_x != 0 && delta_y.abs == delta_x.abs) ? (diag_move = true) : (diag_move = false)

    # loop through coords along proposed path and check if empty
    # ignore begin and end coords
    y_range.each do |y|
      x_range.each do |x|
        next if [y,x] == position_1 || [y,x] == position_2 || (diag_move && (y - begin_y).abs != (x - begin_x).abs)
        # go to next x if loop is at current or proposed position or is not along diagonal
        path << [y, x]
        end
      end
    end
  end

end
