class Pet < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  belongs_to :species, optional: true
  has_many :pet_images, dependent: :destroy
  has_many :treatments, dependent: :destroy

  def speciesCaption
    species.nil? ? '' : species.name
  end

  def raceCaption
    s = species.nil? ? '' : species.name + (race.nil? ? '' : ' - ')
    r = race.nil? ? '' : race
    s + r
  end

  def genderCaption
    gender == 1 ? 'Male' : (gender == 2 ? "Female" : '')
  end
  
  def sterilisedBool
    sterilised ? 'YES' : 'NO'
  end

  def sterilisedCaption
    sterilised ? 'Sterilised' : 'Not Sterilised'
  end

  def dateOfBirthCaption
    dateOfBirth ? dateOfBirth.strftime("%B %d, %Y") : 'date not set'
  end
end
