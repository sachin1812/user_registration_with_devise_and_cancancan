# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

r1 = Role.create({ name: 'User', description: 'Can edit his/her profile(address or profile pic)' })
r2 = Role.create({ name: 'Admin', description: 'Can edit all the details of other Non-Admin Users' })

u1 = User.create({ name: 'Sachin', email: 'user@example.com', password: 'user@123', password_confirmation: 'user@123', role_id: r1.id })
u2 = User.create({ name: 'Admin', email: 'admin@example.com', password: 'admin@123', password_confirmation: 'admin@123', role_id: r2.id })
