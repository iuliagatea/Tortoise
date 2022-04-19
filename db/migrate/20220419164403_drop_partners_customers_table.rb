class DropPartnersCustomersTable < ActiveRecord::Migration
  def change
    drop_table :partners_customers
  end
end
