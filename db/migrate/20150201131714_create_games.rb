class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.integer :game_id
    	t.integer :user_id
      t.timestamps
    end
    add_index :games, :game_id
    add_index :games, :user_id
  end
end
