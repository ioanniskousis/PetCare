class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :datetime
      t.string :title
      t.text :content
      t.string :location
      t.boolean :done

      t.timestamps
    end
  end
end
