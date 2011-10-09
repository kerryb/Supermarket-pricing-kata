require_relative "../lib/quantity_discount_rule"

describe QuantityDiscountRule do
  subject { QuantityDiscountRule.new "A", 10, 3, 25 }

  describe "#price" do
    context "when the item matches" do
      context "up to the discount quantity" do
        it "returns the basic price" do
          subject.price("A").should == 10
        end
      end

      context "at the discount quantity" do
        it "returns the discounted unit price" do
          2.times { subject.price "A" }
          subject.price("A").should == 5
        end
      end

      context "above the discount quantity" do
        it "returns the basic price again" do
          3.times { subject.price "A" }
          subject.price("A").should == 10
        end
      end

      context "at a multiple of the discount quantity" do
        it "returns the discounted unit price again" do
          5.times { subject.price "A" }
          subject.price("A").should == 5
        end
      end
    end

    context "when the item does not match" do
      it "returns zero" do
        subject.price("B").should == 0
      end
    end
  end
end
