class CreateLostPhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :lost_photos do |t|
      t.references :lost
      t.timestamps
    end
  end
end
