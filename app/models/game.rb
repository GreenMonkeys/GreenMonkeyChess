class Game < ActiveRecord::Base
	has_many :users
	has_many :pieces

	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
