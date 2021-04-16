class AddUserRefToTreatments < ActiveRecord::Migration[6.1]
  def change
    add_reference :treatments, :user, null: true, foreign_key: true
  end
end
