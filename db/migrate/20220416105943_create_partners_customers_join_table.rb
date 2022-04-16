class CreatePartnersCustomersJoinTable < ActiveRecord::Migration
  def change
    create_table :partners_customers do |t|
      t.belongs_to :partner
      t.belongs_to :customer

      t.timestamps
    end
  end
end