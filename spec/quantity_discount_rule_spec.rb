require_relative "../lib/quantity_discount_rule"

describe QuantityDiscountRule do
  let(:checkout) { stub number_already_bought: 0 }
  subject { QuantityDiscountRule.new "A", 10, 3, 25 }

  describe "#price" do
    context "when the item matches" do
      context "up to the discount quantity" do
        it "returns the basic price" do
          subject.price("A", checkout).should == 10
        end
      end

      context "at the discount quantity" do
        before { checkout.stub(:number_already_bought).with("A").and_return 2 }

        it "returns the discounted unit price" do
          subject.price("A", checkout).should == 5
        end
      end

      context "above the discount quantity" do
        before { checkout.stub(:number_already_bought).with("A").and_return 3 }

        it "returns the basic price again" do
          subject.price("A", checkout).should == 10
        end
      end

      context "at a multiple of the discount quantity" do
        before { checkout.stub(:number_already_bought).with("A").and_return 5 }

        it "returns the discounted unit price again" do
          subject.price("A", checkout).should == 5
        end
      end
    end

    context "when the item does not match" do
      it "returns zero" do
        subject.price("B", checkout).should == 0
      end
    end
  end
end
