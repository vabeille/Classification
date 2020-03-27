class Dossier < ApplicationRecord
  belongs_to :carton
  validates :sujet, :client, presence: true
end
