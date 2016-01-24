require_relative "lib/errors"
require_relative "lib/customer"
require_relative "lib/product"
require_relative "lib/transaction"

# PRODUCTS

Product.new(title: "LEGO Iron Man vs. Ultron", price: 22.99, stock: 55)
Product.new(title: "Nano Block Empire State Building", price: 49.99, stock: 12)
Product.new(title: "LEGO Firehouse Headquarter", price: 199.99, stock: 0)

puts Product.all.count # Should return 3

#Product.new(title: "LEGO Iron Man vs. Ultron", price: 22.99, stock: 55)
# Should return DuplicateProductError: 'LEGO Iron Man vs. Ultron' already exists.

nanoblock = Product.find_by_title("Nano Block Empire State Building")
firehouse = Product.find_by_title("LEGO Firehouse Headquarter")

puts nanoblock.title # Should return 'Nano Block Empire State Building'
puts nanoblock.price # Should return 49.99
puts nanoblock.stock # Should return 12
puts nanoblock.in_stock? # Should return true
puts firehouse.in_stock? # Should return false

products_in_stock = Product.in_stock
# Should return an array of all products with a stock greater than zero
puts products_in_stock.include?(nanoblock) # Should return true
puts products_in_stock.include?(firehouse) # Should return false

# CUSTOMERS

Customer.new(name: "Walter Latimer")
Customer.new(name: "Julia Van Cleve")

puts Customer.all.count # Should return 2

# Customer.new(name: "Walter Latimer")
# Should return DuplicateCustomerError: 'Walter Latimer' already exists.

walter = Customer.find_by_name("Walter Latimer")

puts walter.name # Should return "Walter Latimer"

# TRANSACTIONS

transaction = Transaction.new(walter, nanoblock)

puts transaction.id # Should return 1
puts transaction.product == nanoblock # Should return true
puts transaction.product == firehouse # Should return false
puts transaction.customer == walter # Should return true

puts nanoblock.stock # Should return 11

# PURCHASES

puts walter.purchase(nanoblock)

puts Transaction.all.count # Should return 2

transaction2 = Transaction.find(2)
puts transaction2.product == nanoblock # Should return true

# walter.purchase(firehouse)
# Should return OutOfStockError: 'LEGO Firehouse Headquarter' is out of stock.
#

# Test new feature below
puts "\n\nNew features are tested below"
puts "-" * 40
puts "There are #{nanoblock.stock} nano blocks."
puts "Walter buy 4 nano blocks."
walter.purchase(nanoblock, count: 4)
puts "Now there are #{nanoblock.stock} nano blocks." # Should return 6
puts

ada = Customer.new(name: "Ada", age: 24, gender: "Female")
puts "Below is Ada's infomation:"
ada.print
puts

puts "Ada try to buy 8 nano blocks"
Transaction.new(ada, nanoblock, count: 8)
# Should return OutOfStockError: 'Nano Block Empire State Building' is out of stock.


