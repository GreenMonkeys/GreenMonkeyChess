class Piece < ActiveRecord::Base
	belongs_to :user
	belongs_to :game


	#Allows an easier navigation between model. E.g.  Rook.find(56) => <Rook id: 56, name: :rook, color: :white, image: nil, position: 00, game_id: 20...>
  scope :rooks, -> { where(type: 'Rook') } 
  scope :knights, -> { where(type: 'Knight') } 
  scope :bishops, -> { where(type: 'Bishop') }
  scope :kings, -> {where(type: 'King') }
  scope :queens, -> {where(type: 'Queen') }
  scope :pawns, -> {where(type: 'Pawn') }

  def move_to!(x_axis, y_axis)
  	if same_piece(x_axis, y_axis).nil? 
      update_attributes(:x_axis => x_axis, :y_axis => y_axis)
  	elsif self.color == same_piece(x_axis, y_axis).color
      print "Traitor!"
  	end
  end
  
  def same_piece(target_x_axis, target_y_axis)
   actual_board = Game.find(self.game_id)
   actual_board.board[target_y_axis][target_x_axis]
  end


end
