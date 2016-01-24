class Product
  attr_reader :title, :price
  attr_accessor :stock

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
end
