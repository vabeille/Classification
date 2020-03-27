class ChangeNomComplet < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :nomcomplet
    add_column :users, :nomcomplet, :string, null: false, default: ""
  end
end
