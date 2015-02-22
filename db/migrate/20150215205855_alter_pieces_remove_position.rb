class AlterPiecesRemovePosition < ActiveRecord::Migration
  def change
  	remove_column :pieces, :position
  end
end
