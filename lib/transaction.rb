class Transaction
  attr_reader :id, :customer, :product

  @@id = 1
  @@transactions = []

  def initialize(customer, product)
    product.bought
    @customer = customer
    @product = product
    @id = @@id
    @@id += 1
    @@transactions << self
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.select { |transaction| transaction.id ==id }.first
  end

end
