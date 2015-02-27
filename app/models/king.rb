class King < Piece
	def valid_move?(position_2)
		unless self.distance(position_2) != 1
			self.raise_exceptions(position_2)
			return true	if self.horizontal_move?(position_2) || self.vertical_move?(position_2) || self.diagonal_move?(position_2)
    end
			return false
	end

end
