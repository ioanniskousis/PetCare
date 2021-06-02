class CreateFounds < ActiveRecord::Migration[6.1]
  def change
    create_table :founds do |t|
      t.text :comments, null: false
      t.boolean :resolved
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
