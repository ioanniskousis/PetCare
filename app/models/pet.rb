class Pet < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :pet_images, dependent: :destroy
  has_many :treatments, dependent: :destroy

end
