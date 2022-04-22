class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :recovery_password_digest
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.string :company
      t.text :description
      t.string :location
      t.string :type

      t.timestamps null: false
    end
  end

  def down
    drop_table :users
  end
end
