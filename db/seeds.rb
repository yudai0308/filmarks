require "csv"

orders_csv = CSV.readlines("db/awards.csv")
orders_csv.shift
orders_csv.each do |row|
  Order.create(name: row[1], created_at: row[2], updated_at: row[3], subname: row[4])
end

products_csv = CSV.readlines("db/products.csv")
products_csv.shift
