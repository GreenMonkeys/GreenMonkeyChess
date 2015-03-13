class King < Piece
	def valid_move?(position_2)
		unless self.distance(position_2) != 1 || self.game.is_obstructed?(self.current_position, position_2)
			return true
		else
			return false
		end
	end

	opposite_color = {'black' => 'white', 'white' => 'black'}

	def checked?(position)
		self.game.pieces.where(:color => opposite_color[self.color]).find_each do |piece|
			if piece.valid_move?(position)
				return true
			end
		end
		return false
	end

	def check_mate?
		self.possible_moves.each do |move|
			if self.valid_move?(move)
				if self.checked?(move)
					self.check_piece.game.find_path(self.check_piece.current_position, self.current_position).each do |step|
						self.game.pieces.where(:color => opposite_color[self.color]).find_each do |piece|
							if piece.valid_move?(step)
								return true
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
		moves << [self.y_axis, self.x_axis]
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
			self.game.pieces.where(:color => opposite_color[self.color]).find_each do |piece|
				if piece.valid_move?(self.current_position)
					piece.type
				end
			end
		end
	end
end
