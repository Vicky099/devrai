class AddAmountToDonation < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :amount, :integer, default: 0
  end
end
