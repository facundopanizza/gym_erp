# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

teacher = Teacher.create(first_name: "Oscar", last_name: "Oscar", dni: "12312312", phone_number: "1231231231", birthday: "1990-01-01")

user = User.create(email: "oscar@gmail.com", password: "123456", teacher: teacher)

