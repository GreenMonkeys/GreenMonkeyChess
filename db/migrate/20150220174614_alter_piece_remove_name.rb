class AlterPieceRemoveName < ActiveRecord::Migration
  def change
  	remove_column :pieces, :name
  end
end
