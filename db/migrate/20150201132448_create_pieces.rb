class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
    	t.string :name
    	t.string :color
    	t.string :image
    	t.string :position
    	t.integer :game_id
      t.timestamps
    end
    add_index :pieces, :game_id
    add_index :pieces, :name
    add_index :pieces, :position
  end
end
