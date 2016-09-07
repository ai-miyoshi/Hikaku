# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  User.create(email: 'tech-camp@gmail.com', password: '12345678', nickname: 'Mako')


require "csv"

corporations_csv = CSV.readlines("db/corporations.csv")
corporations_csv.shift
corporations_csv.each do |row|
  Company.create(corporate_name: row[1], c_url: row[2], : image_url[3])
end