class Knight < Piece

  def valid_move?(position_2) # knight moves in L shaped pattern
    self.ensure_reasonable_move!(position_2)
    if (self.delta_x(position_2).abs == 1 && self.delta_y(position_2).abs == 2) ||
      (self.delta_y(position_2).abs == 1 && self.delta_x(position_2).abs == 2)
      return true
    end
    return false
  end
  
end