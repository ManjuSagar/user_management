# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

##<User id: nil, email: "", encrypted_password: "", reset_password_token: nil, reset_password_sent_at: nil,
# remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil,
# last_sign_in_ip: nil, role: nil, first_name: nil, last_name: nil, created_at: nil, updated_at: nil>

unless User.find_by_email("admin@gmail.com")
  user = User.new
  user.email = "admin@gmail.com"
  user.role = "manager"
  user.first_name = "manager"
  user.last_name = "test"
  user.password = "test1234"
  user.save!
end