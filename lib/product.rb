class Product
  @@products = []

  def initialize(info)
    @@products << self
  end

  def self.all
    @@products
  end
end
