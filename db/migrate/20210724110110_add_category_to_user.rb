class AddCategoryToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :category, :string, default: "User"
  end
end
