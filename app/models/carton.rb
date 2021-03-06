class Carton < ApplicationRecord
  belongs_to :user
  has_many :dossiers, dependent: :destroy
  validates :matiere, :annee, :localisation, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_matiere_annee,
    against: [:matiere, :annee, :localisation],
      associated_against: {
      dossiers: [ :sujet, :client ]
    },
    using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end

