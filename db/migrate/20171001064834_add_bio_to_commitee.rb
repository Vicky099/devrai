class AddBioToCommitee < ActiveRecord::Migration[5.1]
  def change
    add_column :commitees, :bio, :text
  end
end
