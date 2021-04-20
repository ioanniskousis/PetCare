class CreateTreatments < ActiveRecord::Migration[6.1]
  def change
    create_table :treatments do |t|
      t.references :pet, null: true
      t.string :item
      t.string :description
      t.float :cost
      t.string :location

      t.timestamps
    end
  end
end
