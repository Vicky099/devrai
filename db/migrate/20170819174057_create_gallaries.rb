class CreateGallaries < ActiveRecord::Migration[5.1]
  def change
    create_table :gallaries do |t|
      t.string :name
      t.datetime :photo_date
      t.timestamps
    end
  end
end
