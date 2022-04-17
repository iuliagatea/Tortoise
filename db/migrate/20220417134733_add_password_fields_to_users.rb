class AddPasswordFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :recovery_password_digest, :string
  end
end
