class AddUniqueIndexToEmailOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :email, :string, null: false
    change_column :users, :name, :string, null: false
    add_index :users, :email, unique: true
  end
end
