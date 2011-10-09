require_relative "rules"

class Checkout
  attr_reader :total

  def initialize rules
    @rules = rules
    @total = 0
  end

  def scan item
    @total += RULES.price(item)
  end
end
