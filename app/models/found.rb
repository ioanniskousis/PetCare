class Found < ApplicationRecord
  belongs_to :user
  has_many :photos, foreign_key: "found_id", class_name: "FoundPhoto", dependent: :destroy
end
