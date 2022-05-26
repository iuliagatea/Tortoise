class AddColumnToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :is_canceled, :bool
  end
end
