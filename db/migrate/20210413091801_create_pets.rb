class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name, length: { minimum: 2 }
      t.string :race
      t.string :breed
      t.string :color
      t.date :dateOfBirth
      t.integer :gender 
      t.boolean :sterilised
      t.text :description
      
      t.timestamps
    end
  end
end
