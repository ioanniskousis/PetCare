class Lost < ApplicationRecord
  belongs_to :user
  has_many :photos, foreign_key: "lost_id", class_name: "LostPhoto", dependent: :destroy
end
