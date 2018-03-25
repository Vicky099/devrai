class AddContactDescToHomeContent < ActiveRecord::Migration[5.1]
  def change
    add_column :home_contents, :content6_desc1, :text
    add_column :home_contents, :content6_desc2, :text
  end
end
