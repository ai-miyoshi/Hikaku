User.create(email: 'tech-camp@gmail.com', password: '12345678', nickname: 'Mako')


require "csv"

corporations_csv = CSV.readlines("db/corporations.csv")
corporations_csv.shift
corporations_csv.each do |row|
  Company.create(corporate_name: row[1], c_url: row[2], image_url: row[3])
end