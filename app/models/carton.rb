class Carton < ApplicationRecord
  has_many :dossiers, dependent: :destroy
end
