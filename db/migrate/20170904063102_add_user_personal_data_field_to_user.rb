class AddUserPersonalDataFieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :date_of_birth, :string
    add_column :users, :contact_no, :string
    add_column :users, :address, :text
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :admin, :boolean, default: false
  end
end
