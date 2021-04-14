class PetImage < ApplicationRecord
  belongs_to :pet
  has_one_attached :photo

end
