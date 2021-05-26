class RemoveSpeciesColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :pets, :species
  end
end
