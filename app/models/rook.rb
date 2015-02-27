class Rook < Piece

  def valid_move?(position_2) # rook moves up/down or left/right
  	self.raise_exceptions(position_2)
    (self.horizontal_move?(position_2) || self.vertical_move?(position_2)) ? true : false
  end
  
end