class ChangeNameToSujetAndAddSensibleToDossier < ActiveRecord::Migration[5.2]
  def change
    add_column :dossiers, :sujet, :string
    remove_column :dossiers, :name
    add_column :dossiers, :sensible, :boolean
  end
end
