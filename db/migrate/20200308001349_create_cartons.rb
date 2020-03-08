class CreateCartons < ActiveRecord::Migration[5.2]
  def change
    create_table :cartons do |t|
      t.string :matiere
      t.string :annee
      t.string :localisation
      t.integer :chrono

      t.timestamps
    end
  end
end
