class CreateMealPhotos < ActiveRecord::Migration
  def change
    create_table :meal_photos do |t|
   	  t.attachment :photo
      t.timestamps

      #foreign keys
      t.belongs_to :meal
    end
  end
end
