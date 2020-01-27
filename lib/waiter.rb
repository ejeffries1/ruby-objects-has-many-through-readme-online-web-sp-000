class Waiter
  attr_accessor :name, :years

  @@all = []
  def initialize(name, years)
    @name = name
    @years = years
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select do |m|
      m.waiter == self
    end
  end

  def best_tipper
    Customer.all.each do |amount|
      amount.tip.max == self
    end
  end
end
