class CreateServices < ActiveRecord::Migration
  def up
    create_table :services do |t|
      t.string :name
      t.float :price
      t.string :duration
      t.references :partner, index: true

      t.timestamps null: false
    end
    add_foreign_key :services, :users, column: :partner_id
  end

  def down
    drop_table :services
  end
end
