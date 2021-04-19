class AddDateToTreatments < ActiveRecord::Migration[6.1]
  def change
    add_column :treatments, :date, :datetime
    add_index :treatments, :date
  end
end
