class AddCategoryToTreatments < ActiveRecord::Migration[6.1]
  def change
    add_reference :treatments, :category, references: :treatment_categories, index: true
  end
end
