class AlterPiecesAddColumnAxisAndType < ActiveRecord::Migration
  def change
  	add_column :pieces, :x_axis, :integer
  	add_column :pieces, :y_axis, :integer
  	add_column :pieces, :type, :string

  	add_index :pieces, :x_axis
  	add_index :pieces, :y_axis
  	add_index :pieces, :type
  end
end
