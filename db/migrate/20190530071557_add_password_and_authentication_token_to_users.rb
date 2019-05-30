class AddPasswordAndAuthenticationTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password, :string, null: false, default: ''
    add_column :users, :authentication_token, :string
  end
end
