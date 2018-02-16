class ChangeDataTypesToMember < ActiveRecord::Migration[5.1]
  def change
    change_column :members, :gender, :string
    change_column :members, :membership, :string
  end
end
