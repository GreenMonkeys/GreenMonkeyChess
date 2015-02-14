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

  PIECESIMG = {
   'whiteQueen' => 'white-queen.gif',
   'whiteKing' => 'white-king.gif',
   'whiteRook' => 'white-rook.gif',
   'whiteBishop' => 'white-bishop.gif',
   'whiteKnight' => 'white-knight.gif',
   'whitePawn' => 'white-pawn.gif',
   'blackQueen' => 'black-queen.gif',
   'blackKing' => 'black-king.gif',
   'blackRook' => 'black-rook.gif',
   'blackBishop' => 'black-bishop.gif',
   'blackKnight' => 'black-knight.gif',
   'blackPawn' => 'black-pawn.gif'
  }

   def pieceImg
    PIECESIMG["#{self.color}" + "#{self.name.capitalize}"]
  end
end
