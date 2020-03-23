class AddSensibleToCarton < ActiveRecord::Migration[5.2]
  def change
    add_column :cartons, :sensible, :boolean
  end
end
