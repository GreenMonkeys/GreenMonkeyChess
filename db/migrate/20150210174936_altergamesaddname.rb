class Altergamesaddname < ActiveRecord::Migration
  def change
  	add_column :games, :name, :string
  	remove_column :games, :game_id
  end
end
