class AddNomcompletToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nomcomplet, :string
  end
end
