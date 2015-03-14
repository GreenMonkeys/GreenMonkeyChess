class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pieces
  has_many :games
  has_many :challenged_games, :class_name => "Game",
    :foreign_key => 'opponent_id'
end
