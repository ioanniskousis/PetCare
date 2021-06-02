class CreateFoundPhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :found_photos do |t|
      t.references :found, null: false, foreign_key: true

      t.timestamps
    end
  end
end
