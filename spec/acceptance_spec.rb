require_relative "../lib/checkout"

describe "Checkout acceptance test" do
  def price(goods)
    co = Checkout.new(RULES)
    goods.split(//).each { |item| co.scan(item) }
    co.total
  end

  it "totals prices correctly" do
    price("").should == 0
    price("A").should == 50
    price("AB").should == 80
    price("CDBA").should == 115

    price("AA").should == 100
    price("AAA").should == 130
    price("AAAA").should == 180
    price("AAAAA").should == 230
    price("AAAAAA").should == 260

    price("AAAB").should == 160
    price("AAABB").should == 175
    price("AAABBD").should == 190
    price("DABABA").should == 190
  end

  it "works incrementally" do
    co = Checkout.new(RULES)
    co.total.should == 0
    co.scan("A"); co.total.should == 50
    co.scan("B"); co.total.should == 80
    co.scan("A"); co.total.should == 130
    co.scan("A"); co.total.should == 160
    co.scan("B"); co.total.should == 175
  end
end
