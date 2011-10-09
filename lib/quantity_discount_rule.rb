class QuantityDiscountRule
  def initialize item, basic_price, discount_quantity, discount_price
    @item, @basic_price = item, basic_price
    @discount_quantity, @discount_price = discount_quantity, discount_price
    @number_purchased = 0
  end

  def price item
    @item == item ? @basic_price - discount : 0
  end

  private

  def discount
    @number_purchased = (@number_purchased + 1) % @discount_quantity
    if @number_purchased == 0
      @basic_price * @discount_quantity - @discount_price
    else
      0
    end
  end
end
