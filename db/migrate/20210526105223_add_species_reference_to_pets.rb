class AddSpeciesReferenceToPets < ActiveRecord::Migration[6.1]
  def change
    add_reference :pets, :species, null: true, foreign_key: true
  end
end
