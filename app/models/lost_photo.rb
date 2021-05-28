class LostPhoto < ApplicationRecord
  belongs_to :lost
  has_one_attached :photo
end
