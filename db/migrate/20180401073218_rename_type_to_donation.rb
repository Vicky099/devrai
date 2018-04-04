class RenameTypeToDonation < ActiveRecord::Migration[5.1]
  def change
    rename_column :donations, :type, :type_of_donation
  end
end
