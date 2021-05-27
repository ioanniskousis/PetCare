class CreateLosts < ActiveRecord::Migration[6.1]
  def change
    create_table :losts do |t|
      t.text :comments, null: false
      t.references :user, null: false, foreign_key: true
      t.boolean :resolved

      t.timestamps
    end
  end
end
