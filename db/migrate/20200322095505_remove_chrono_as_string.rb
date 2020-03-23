class RemoveChronoAsString < ActiveRecord::Migration[5.2]
  def change
    remove_column :cartons, :chrono
    add_column :cartons, :chrono, :string
  end
end
