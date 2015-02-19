class Piece < ActiveRecord::Base
	belongs_to :user
	belongs_to :game


	#Allows an easier navigation between model. E.g.  Rook.find(56) => <Rook id: 56, name: :rook, color: :white, image: nil, position: 00, game_id: 20...>
  scope :rooks, -> { where(type: 'Rook') } 
  scope :knights, -> { where(type: 'Knight') } 
  scope :bishops, -> { where(type: 'Bishop') }
  scope :kings, -> {where(type: 'King') }
  scope :queens, -> {where(type: 'Queen') }
  scope :pawns, -> {where(type: 'Pawn') }

  def validate_move?(position_1, position_2)
    if self.game.is_obstructed(position_1, position_2) == false # check for obstructions first
      case self.type
      when "Rook"
        self.rook_move?(position_1, position_2)
      when "Knight"
        self.knight_move?(position_1, position_2)
      when "Bishop"
        self.bishop_move?(position_1, position_2)
      when "King"
        self.king_move?(position_1, position_2)
      when "Queen"
        self.queen_move?(position_1, position_2)
      when "Pawn"
        self.pawn_move?(position_1, position_2)
      end
    end
    return false
  end

  # define some helper methods
  def self.delta_x(position_1, position_2)
    delta_x = position_2[1] - position_1[1]
  end

  def self.delta_y(position_1, position_2)
    delta_y = position_2[0] - position_1[0]
  end

  def self.distace(position_1, position_2)
    sqrt(delta_y ** 2 + delta_x ** 2)
  end

  def self.horizontal_move?(position_1, position_2)
    (delta_y(position_1, position_2) == 0 && delta_x(position_1, position_2) != 0) ? true : false
  end

  def self.vertical_move?(position_1, position_2)
    (delta_x(position_1, position_2) == 0 && delta_y(position_1, position_2) != 0) ? true : false
  end

  def self.diagonal_move?(position_1, position_2)
    delta_y(position_1, position_2).abs == delta_x(position_1, position_2).abs ? true : false
  end

  # define methods to check moves for each piece type
  def rook_move?(position_1, position_2)
    (horizontal_move?(position_1, position_2) || vertical_move?(position_1, position_2)) ? true : false
  end

  def knight_move?(position_1, position_2)
    if (delta_x(position_1, position_2).abs == 1 && delta_y(position_1, position_2).abs == 2) ||
      (delta_y(position_1, position_2).abs == 1 delta_x(position_1, position_2).abs == 2)
      return true
    else
      return false
    end
  end

  def bishop_move?(position_1, position_2)
    diagonal_move?(position_1, position_2) ? true : false
  end

  def king_move?(position_1, position_2)
    if (horizontal_move?(position_1, position_2) ||
      vertical_move?(position_1, position_2) ||
      diagonal_move?(position_1, position_2)) &&
      distance(position_1,position_2) == 1
      return true
    else
      return false
    end
  end

  def queen_move?(position_1, position_2)
    if horizontal_move?(position_1, position_2) ||
      vertical_move?(position_1, position_2) ||
      diagonal_move?(position_1, position_2)
      return true
    else
      return false
    end
  end

  def pawn_move?(position_1, position_2)
    if vertical_move?(position_1, position_2)
      return true if distance(position_1,position_2) == 1
      return true if distance(position_1, position_2) == 2 # also need to check if pawn is still at initial position
    elsif diagonal_move?(position_1, position_2) && distance(position_1, position_2) == 1
      # check if diagonal move is being attempted to capture
      return true unless self.game.board[position_2[0], position_1[1]].nil? # also need to check for piece color at position_2
    else
      return false
    end
  end

end
