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

orders_csv = CSV.readlines("db/movies_awards.csv")
orders_csv.shift
orders_csv.each do |row|
  Movie.create(movie_id: row[1], award_id: row[2], created_at: row[3], updated_at: row[4])
end

orders_csv = CSV.readlines("db/movies_countries.csv")
orders_csv.shift
orders_csv.each do |row|
  Movie.create(movie_id: row[1], country_id: row[2], created_at: row[3], updated_at: row[4])
end

orders_csv = CSV.readlines("db/movies_genres.csv")
orders_csv.shift
orders_csv.each do |row|
  Movie.create(movie_id: row[1], genre_id: row[2], created_at: row[3], updated_at: row[4])
end

orders_csv = CSV.readlines("db/movies_members.csv")
orders_csv.shift
orders_csv.each do |row|
  Movie.create(movie_id: row[1], member_id: row[2], created_at: row[3], updated_at: row[4])
end

