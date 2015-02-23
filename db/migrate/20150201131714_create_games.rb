class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.string :name
    	t.integer :user_id
    	t.integer :opponent_id
      	t.timestamps
    end
    add_index :games, :game_id
    add_index :games, :user_id
  end
end
