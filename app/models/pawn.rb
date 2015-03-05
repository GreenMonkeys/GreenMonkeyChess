class Pawn < Piece
  def valid_move?(position_2)
    case self.color
    when "white"
		  unless self.distance(position_2) != 1 || delta_y(position_2) < 0 || self.game.is_obstructed?(self.current_position, position_2)
			  return true	if self.vertical_move?(position_2) || self.diagonal_move?(position_2)
		  end
			  return false
    when "black"
      unless self.distance(position_2) != 1 || delta_y(position_2) > 0 || self.game.is_obstructed?(self.current_position, position_2)
			  return true	if self.vertical_move?(position_2) || self.diagonal_move?(position_2)
		  end
			  return false
    end
  end
end
