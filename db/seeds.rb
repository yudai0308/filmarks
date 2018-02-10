require "csv"

orders_csv = CSV.readlines("db/awards.csv")
orders_csv.shift
orders_csv.each do |row|
  Award.create(name: row[1], created_at: row[2], updated_at: row[3], subname: row[4])
end

orders_csv = CSV.readlines("db/countries.csv")
orders_csv.shift
orders_csv.each do |row|
  Country.create(name: row[1], created_at: row[2], updated_at: row[3])
end

orders_csv = CSV.readlines("db/genres.csv")
orders_csv.shift
orders_csv.each do |row|
  Genre.create(name: row[1], created_at: row[2], updated_at: row[3])
end

orders_csv = CSV.readlines("db/members.csv")
orders_csv.shift
orders_csv.each do |row|
  Member.create(name: row[1], status: row[2], created_at: row[3], updated_at: row[4])
end

orders_csv = CSV.readlines("db/movies.csv")
orders_csv.shift
orders_csv.each do |row|
  Movie.create(title: row[1], subtitle: row[2], image: row[3], time: row[4], story: row[5], production: row[6], release: row[7], create_at: row[8], updated_at: row[9],)
end

