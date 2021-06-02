class FoundPhoto < ApplicationRecord
  belongs_to :found
  has_one_attached :photo
end
