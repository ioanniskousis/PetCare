class TreatmentCategory < ApplicationRecord
  belongs_to :parent, class_name: 'TreatmentCategory', foreign_key: 'parentCategory', optional: true
  has_many :subcategories, class_name: 'TreatmentCategory'
  has_many :treatments
  
end
