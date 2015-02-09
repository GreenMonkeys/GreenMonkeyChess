class Piece < ActiveRecord::Base
	belongs_to :user
	belongs_to :game


	#Allows an easier navigation between model. E.g.  Rook.find(56) => <Rook id: 56, name: :rook, color: :white, image: nil, position: 00, game_id: 20...>
	scope :rook, -> { where(type: 'Rook') } 
	scope :knight, -> { where(type: 'Knight') } 
	scope :bishop, -> { where(type: 'Bishop') }
	scope :king, -> {where(type: 'King') }
	scope :queen, -> {where(type: 'Queen') }
	scope :pawn, -> {where(type: 'Pawn') }

end
