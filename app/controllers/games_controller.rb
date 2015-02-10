class GamesController < ApplicationController

	def move_piece(piece, position2)
		# piece is the current piece being moved (belongs to current user and current game) and it has a current position
		# this method could be adjusted to take in x_axis & y_axis parameters instead of position2

		# convert position into x and y coordinates
		begin_y = piece.position.split(//)[0].to_i
		end_y = position2.split(//)[0].to_i
		begin_x = piece.position.split(//)[1].to_i
		end_x = position2.split(//)[1].to_i
		end_y - begin_y != 0 && end_x - begin_x != 0 ? diag_move? = true : diag_move? = false # check if diagonal move

		# loop through positions along proposed path and check if empty
		(begin_y..end_y).each do |y|
			(begin_x..end_x).each do |x|
				next if piece.position == y.to_s + x.to_s || diag_move? && (y - begin_y).abs != (x - begin_x).abs
				# go to next x if loop is at current position or is not along diagonal
				unless current_game.pieces.where(y_axis: y, x_axis: x).empty?
					# invalid move, exception if piece at position2 is opponents piece
					unless y == end_y && x == end_x && current_game.pieces.where(y_axis: y, x_axis: x).color != piece.color
						return "not a valid move, there is a piece in the way"
					end
				end
			end
		end
		piece.position = position2
	end

end
