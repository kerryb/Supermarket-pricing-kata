class QuantityDiscountRule
  def initialize item, basic_price, discount_quantity, discount_price
    @item, @basic_price = item, basic_price
    @discount_quantity, @discount_price = discount_quantity, discount_price
    @number_purchased = 0
  end

  def price item, checkout
    return 0 unless @item == item
    @basic_price - discount(checkout)
  end

  private

  def discount checkout
    if checkout.number_already_bought(@item) % @discount_quantity == @discount_quantity - 1
      @basic_price * @discount_quantity - @discount_price
    else
      0
    end
  end
end
