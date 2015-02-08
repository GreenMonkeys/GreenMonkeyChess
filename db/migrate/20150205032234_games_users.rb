class GamesUsers < ActiveRecord::Migration
  def change
  	create_table :games_users do |t|
  	  t.belongs_to :games, index: true
      t.belongs_to :users, index: true
  	end
  end
end
