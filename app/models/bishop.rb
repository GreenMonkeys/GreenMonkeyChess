class Bishop < Piece
  def valid_move?(position_2) # queen moves straight in any direction
    self.ensure_reasonable_move!(position_2)
    if self.diagonal_move?(position_2)
      return true unless self.game.is_obstructed?(self.current_position, position_2)
    end
    return false
  end
end
