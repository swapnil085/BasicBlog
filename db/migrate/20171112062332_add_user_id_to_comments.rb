class AddUserIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :userId, :integer
  end
end
