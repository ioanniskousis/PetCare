class CreatePetImages < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_images do |t|
      t.string :description
      t.references :pet

    end
  end
end
