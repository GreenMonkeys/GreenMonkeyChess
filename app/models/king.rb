class King < Piece
	def valid_move?(position_2)
		unless self.distance(position_2) != 1 || self.game.is_obstructed?(self.current_position, position_2)
			return true
		else
			return false
		end
	end
end
