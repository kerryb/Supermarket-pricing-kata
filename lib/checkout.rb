require_relative "rules"

class Checkout
  attr_reader :total

  def initialize rules
    @rules = rules
    @number_of_each_item_bought = Hash.new 0
    @total = 0
  end

  def scan item
    @total += RULES.price(item, self)
    @number_of_each_item_bought[item] += 1
  end

  def number_already_bought item
    @number_of_each_item_bought[item]
  end
end
