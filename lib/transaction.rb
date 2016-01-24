class Transaction
  attr_reader :id, :customer, :product, :count

  @@id = 1
  @@transactions = []

  def initialize(customer, product, count=1)
    product.bought(count)
    @customer = customer
    @product = product
    @count = count
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
