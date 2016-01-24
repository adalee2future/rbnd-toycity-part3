class Transaction
  attr_reader :id, :customer, :product

  @@id = 1

  def initialize(customer, product)
    product.stock -= 1
    @customer = customer
    @product = product
    @id = @@id
    @@id += 1
  end

end
