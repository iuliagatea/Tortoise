class CreateAppointments < ActiveRecord::Migration
  def up
    create_table :appointments do |t|
      t.datetime :date
      t.time :from_time
      t.time :to_time
      t.boolean :is_honoured, default: false
      t.references :service, index: true, foreign_key: true
      t.references :customer, index: true

      t.timestamps null: false
    end
    add_foreign_key :appointments, :users, column: :customer_id
  end

  def down
    drop_table :appointments
  end
end
