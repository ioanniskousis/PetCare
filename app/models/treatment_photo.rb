class TreatmentPhoto < ApplicationRecord
  belongs_to :treatment
  has_one_attached :photo

end
