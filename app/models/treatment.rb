class Treatment < ApplicationRecord
  belongs_to :pet, optional: true
  belongs_to :user
  has_many :treatment_photos, dependent: :destroy


  def dateCaption
    date ? date : 'date not set'
  end
end
