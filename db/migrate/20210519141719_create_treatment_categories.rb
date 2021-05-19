class CreateTreatmentCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :treatment_categories do |t|
      t.string :categoryName
      t.references :parentCategory, index: true, foreign_key: {to_table: :treatment_categories}, optional: true
      t.integer :order, index: true, default: 0
    end
  end
end
