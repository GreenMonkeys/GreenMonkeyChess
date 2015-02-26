class AddOpponentId < ActiveRecord::Migration
  def change
  	add_column :games, :opponent_id, :integer
  	drop_table :games_users
  end
end
