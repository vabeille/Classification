class Dossier < ApplicationRecord
  belongs_to :carton
  validates :name, :client, presence: true
end
