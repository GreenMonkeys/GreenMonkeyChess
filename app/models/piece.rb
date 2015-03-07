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


  IMAGE = {
    :whiteRook => 'white-rook.gif',
    :whiteKnight => 'white-knight.gif',
    :whiteBishop => 'white-bishop.gif',
    :whiteKing => 'white-king.gif',
    :whiteQueen => 'white-queen.gif',
    :whitePawn => 'white-pawn.gif',
    :blackRook => 'black-rook.gif',
    :blackKnight => 'black-knight.gif',
    :blackBishop => 'black-bishop.gif',
    :blackKing => 'black-king.gif',
    :blackQueen => 'black-queen.gif',
    :blackPawn => 'black-pawn.gif'
  }

  def move_to!(x_axis, y_axis)#Check methods piece_at() and capture()
  	if self.game.piece_at(x_axis, y_axis).nil? 
      update_attributes(:x_axis => x_axis, :y_axis => y_axis)
      return true
  	elsif self.color == self.game.piece_at(x_axis, y_axis).color
      return false
    elsif self.color != self.game.piece_at(x_axis, y_axis).color
      capture(x_axis, y_axis)
      return true #"For the king"
  	end
  end
  
  def capture(target_x_axis, target_y_axis)
    captured = self.game.pieces.where(:x_axis => target_x_axis, :y_axis => target_y_axis).first
    captured.update_attributes(:x_axis => nil, :y_axis => nil)
    update_attributes(:x_axis => target_x_axis, :y_axis => target_y_axis)
  end

  def image_select(color, type)
    IMAGE["#{color}#{type}".to_sym]
  end
end
