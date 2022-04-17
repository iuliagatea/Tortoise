class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :from
      t.datetime :to
      t.references :service, index: true, foreign_key: true
      t.references :customer, index: true
      t.references :partner, index: true

      t.timestamps null: false
    end
  end
end
