class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.string :name
      t.string :contact_no
      t.string :village
      t.string :type
      t.datetime :date
      t.string :fund_month
      t.timestamps
    end
  end
end
