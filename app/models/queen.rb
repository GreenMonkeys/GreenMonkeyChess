class Queen < Piece

  def valid_move?(position_2) # queen moves straight in any direction
    self.raise_exceptions(position_2)
    if self.horizontal_move?(position_2) || self.vertical_move?(position_2) || self.diagonal_move?(position_2)
      return true
    else
      return false
    end
  end
	
end