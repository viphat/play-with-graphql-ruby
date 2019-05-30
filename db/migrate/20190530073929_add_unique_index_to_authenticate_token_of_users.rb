class AddUniqueIndexToAuthenticateTokenOfUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :authentication_token, unique: true
  end
end
