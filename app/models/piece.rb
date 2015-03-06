class Piece < ActiveRecord::Base
	belongs_to :user
	belongs_to :game

	 #Allows an easier navigation between model. E.g.  Rook.find(56) => <Rook id: 56, name: :rook, color: :white, image: nil, position: 00, game_id: 20...>
  scope :rooks, -> { where(type: 'Rook') }
  scope :knights, -> { where(type: 'Knight') }
  scope :bishops, -> { where(type: 'Bishop') }
  scope :kings, -> { where(type: 'King') }
  scope :queens, -> { where(type: 'Queen') }
  scope :pawns, -> { where(type: 'Pawn') }

  def move_to!(x_axis, y_axis)#Check methods piece_at() and capture()
	unless !self.valid_move?([y_axis, x_axis])
  	if self.game.piece_at(x_axis, y_axis).nil?
      update_attributes(:x_axis => x_axis, :y_axis => y_axis)
      return true
  	elsif self.color == self.game.piece_at(x_axis, y_axis).color
      return false
    elsif self.color != self.game.piece_at(x_axis, y_axis).color
      capture(x_axis, y_axis)
      return true #"For the king"
  	end
	end
	return false
  end

  def capture(target_x_axis, target_y_axis)
    captured = self.game.pieces.where(:x_axis => target_x_axis, :y_axis => target_y_axis).first
    captured.update_attributes(:x_axis => nil, :y_axis => nil)
    update_attributes(:x_axis => target_x_axis, :y_axis => target_y_axis)
  end

  # define some helper methods for move validation
  def ensure_reasonable_move!(position_2)
    raise "this move is not within the board" unless self.move_within_board?(position_2)
  end

  def current_position
    [self.y_axis, self.x_axis]
  end

  def delta_x(position_2)
    delta_x = position_2[1] - self.current_position[1]
  end

  def delta_y(position_2)
    delta_y = position_2[0] - self.current_position[0]
  end

  def distance(position_2)
    Math.sqrt(self.delta_y(position_2) ** 2 + self.delta_x(position_2) ** 2).to_i
  end

  def horizontal_move?(position_2)
    (delta_y(position_2) == 0 && delta_x(position_2) != 0) ? true : false
  end

  def vertical_move?(position_2)
    (delta_x(position_2) == 0 && delta_y(position_2) != 0) ? true : false
  end

  def diagonal_move?(position_2)
    delta_y(position_2).abs == delta_x(position_2).abs ? true : false
  end

  def move_within_board?(position_2)
    position_2.select{|coord| coord > 7 || coord < 0}.empty? ? true : false
  end
end
