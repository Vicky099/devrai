class CreateCommitees < ActiveRecord::Migration[5.1]
  def change
    create_table :commitees do |t|
      t.string :name
      t.string :designation
      t.string :status
      t.timestamps
    end
  end
end
