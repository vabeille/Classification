class ChangeNomdefamilleEtPrenomAjoutNullFalse < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :prenom
    remove_column :users, :nom_de_famille
    add_column :users, :prenom, :string, null: false, default: ""
    add_column :users, :nom_de_famille, :string, null: false, default: ""
  end
end
