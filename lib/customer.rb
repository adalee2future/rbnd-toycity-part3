class Customer
  attr_reader :name, :gender, :age

  @@customers = []

  def initialize(options={})
    @name = options.fetch(:name, nil)
    @gender = options.fetch(:gender, nil)
    @age = options.fetch(:age, nil)
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    @@customers.select { |customer| customer.name == name }.first
  end

  def add_to_customers
    if @@customers.map { |customer| customer.name }.include? @name
      raise DuplicateCustomerError, "'#{@name}' already exists!"
    end
    @@customers << self
  end

  def purchase(product, options={count: 1})
    Transaction.new(self, product, options)
  end

  def print
    puts "Name: #@name, Gender: #@gender, Age: #@age"
  end
end
