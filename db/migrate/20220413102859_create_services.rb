class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.float :price
      t.string :duration
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
