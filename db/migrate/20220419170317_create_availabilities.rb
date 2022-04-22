class CreateAvailabilities < ActiveRecord::Migration
  def up
    create_table :availabilities do |t|
      t.references :partner, index: true
      t.string :wday
      t.datetime :date
      t.time :from_time
      t.time :to_time

      t.timestamps null: false
    end
    add_foreign_key :availabilities, :users, column: :partner_id
  end

  def down
    drop_table :availabilities
  end
end
