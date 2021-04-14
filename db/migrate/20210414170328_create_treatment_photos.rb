class CreateTreatmentPhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :treatment_photos do |t|
      t.string :description
      t.references :treatment

      t.timestamps
    end
  end
end
