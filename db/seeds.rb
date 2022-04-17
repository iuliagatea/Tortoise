# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
partners_list = []
(1..3).each do |index|
  partners_list << { first_name: "Partner#{index}", last_name: 'Test', email: "partner#{index}@test.com" }
end

partners_list.each do |user_attributes|
  new_user = Partner.find_or_initialize_by(email: user_attributes[:email])
  user_attributes[:password] = 'P@ssw0rd'
  new_user.update_attributes(user_attributes)
end

customers_list = []
(0..11).each do |index|
  customers_list << { first_name: "Customer#{index}", last_name: 'Test', email: "customer#{index}@test.com" }
end

customers_list.each do |user_attributes|
  new_user = Customer.find_or_initialize_by(email: user_attributes[:email])
  user_attributes[:password] = 'P@ssw0rd'
  new_user.update_attributes(user_attributes)
end

services_list = []
(1..10).each do |index|
  services_list << { name: "Service#{index}", price: rand(max = 100), duration: rand(max = 100) }
end

services_list.each do |service_attributes|
  Partner.all.each do |partner|
    new_service = Service.new
    service_attributes[:user_id] = partner.id
    new_service.update_attributes(service_attributes)
  end
end

appointments_list = []
(1..30).each do |_index|
  service_id = Service.ids.sample
  partner_id = Service.find(service_id).user_id
  appointments_list << { from: DateTime.now, to: DateTime.now + rand(1..60).minutes, service_id: service_id,
                         partner_id: partner_id, customer_id: Customer.ids.sample }
end

appointments_list.each do |appointment_attributes|
  new_appointment = Appointment.new
  new_appointment.update_attributes(appointment_attributes)
end