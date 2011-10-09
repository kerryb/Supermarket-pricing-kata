class SimpleRule
  def initialize item, price
    @item, @price = item, price
  end

  def price item
    @item == item ? @price : 0
  end
end
