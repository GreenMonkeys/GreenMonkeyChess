class RemoveGameId < ActiveRecord::Migration
  def change
  	remove_column :games, :game_id
  end
end
