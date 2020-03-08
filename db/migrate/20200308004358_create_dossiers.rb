class CreateDossiers < ActiveRecord::Migration[5.2]
  def change
    create_table :dossiers do |t|
      t.string :name
      t.string :client
      t.references :carton, foreign_key: true

      t.timestamps
    end
  end
end
