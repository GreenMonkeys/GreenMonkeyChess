class Rook < Piece

  def valid_move?(position_2) # rook moves up/down or left/right
    self.ensure_reasonable_move!(position_2)
    if self.horizontal_move?(position_2) || self.vertical_move?(position_2)
      return true unless self.game.is_obstructed?(self.current_position, position_2)
    else
      return false
    end
  end
  
end