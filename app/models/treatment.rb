class Treatment < ApplicationRecord
  belongs_to :pet
  has_many :treatment_photos, dependent: :destroy

end
