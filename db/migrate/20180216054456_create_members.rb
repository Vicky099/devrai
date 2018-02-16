class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :firstname
      t.string :lastname
      t.integer :gender
      t.string :mobile_number
      t.string :email_id
      t.string :village
      t.string :taluka
      t.string :district
      t.string :state
      t.text :about_me
      t.text :about_devrai
      t.integer :tree_planted_count, default: 0
      t.integer :membership, default: 0
      t.timestamps
    end
  end
end
