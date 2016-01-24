class Product
  attr_reader :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(title)
    @@products.select { |product| product.title == title }.first
  end

  def self.in_stock
    @@products.select { |product| product.in_stock? }
  end

  def in_stock?
    @stock > 0
  end

  def add_to_products
    if @@products.map(&:title).include? @title
      raise DuplicateProductError, "'#{@title}' already exists!"
    end
    @@products << self
  end

  def bought(count=1)
    if @stock < count
      raise OutOfStockError, "'#{@title}' is out of stock!"
    end
    @stock -= count
  end
end
