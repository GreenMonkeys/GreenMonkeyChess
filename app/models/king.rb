class King < Piece
	def valid_move?(position_2)
		unless self.distance(position_2) != 1 || self.game.is_obstructed?(self.current_position, position_2)
			return true
		else
			return false
		end
	end

	def checked?(position)
		case self.color
		when "white"
			self.game.pieces.where(:color => "black").find_each do |piece|
				if piece.valid_move?(position)
					return true
				end
			end
		when "black"
			self.game.pieces.where(:color => "white").find_each do |piece|
				if piece.valid_move?(position)
					return true
				end
			end
		end
		return false
	end

	def check_mate?
		self.possible_moves.each do |move|
			if self.valid_move?(move)
				if self.checked?(move)
					self.check_piece.game.find_path(self.check_piece.current_position, self.current_position).each do |step|
						case self.color
						when "white"
							self.game.pieces.where(:color => "white").find_each do |piece|
								if piece.valid_move?(step)
									return true
								end
							end
						when "black"
							self.game.pieces.where(:color => "black").find_each do |piece|
								if piece.valid_move?(step)
									return true
								end
							end
						end
					end
				end
			end
		end
		return false
	end

	def possible_moves
		moves = []
		moves << [self.y_axis, self.x_axis + 1] 
		moves << [self.y_axis, self.x_axis - 1]
		moves << [self.y_axis + 1, self.x_axis]
		moves << [self.y_axis - 1, self.x_axis]
		moves << [self.y_axis + 1, self.x_axis + 1]
		moves << [self.y_axis + 1, self.x_axis - 1]
		moves << [self.y_axis - 1, self.x_axis + 1]
		moves << [self.y_axis - 1, self.x_axis - 1]
		moves
	end

	def check_piece
		if self.checked?(self.current_position)
			case self.color
			when "white"
				self.game.pieces.where(:color => "black").find_each do |piece|
					if piece.valid_move?(self.current_position)
						piece.type
					end
				end
			when "black"
				self.game.pieces.where(:color => "white").find_each do |piece|
					if piece.valid_move?(self.current_position)
						piece.type
					end
				end
			end
		end
	end
end
