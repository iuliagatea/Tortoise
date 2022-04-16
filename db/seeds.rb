# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# partners_list = []
# (1..3).each do |index|
#   partners_list << { first_name: "Partner#{index}", last_name: 'Test', email: "partner#{index}@test.com" }
# end
#
# partners_list.each do |user_attributes|
#   new_user = Partner.find_or_initialize_by(email: user_attributes[:email])
#   user_attributes[:password] = 'P@ssw0rd'
#   new_user.update_attributes(user_attributes)
# end
#
# customers_list = []
# (1..10).each do |index|
#   customers_list << { first_name: "Customer#{index}", last_name: 'Test', email: "customer#{index}@test.com" }
# end
#
# customers_list.each do |user_attributes|
#   new_user = Customer.find_or_initialize_by(email: user_attributes[:email])
#   user_attributes[:password] = 'P@ssw0rd'
#   new_user.update_attributes(user_attributes)
# end

# services_list =[]
# (1..10).each do |index|
#   services_list << { name: "Service#{index}", price: rand(max = 100), duration: rand(max=100)}
# end
#
# services_list.each do |service_attributes|
#   Partner.all.each do |partner|
#     new_service = Service.new
#     service_attributes[:user_id] = partner.id
#     new_service.update_attributes(service_attributes)
#   end
# end