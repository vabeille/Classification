class RemoveNomComplet < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :nomcomplet
  end
end
