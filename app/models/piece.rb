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
end
