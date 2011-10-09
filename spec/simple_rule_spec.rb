require_relative "../lib/simple_rule"

describe SimpleRule do
  subject { SimpleRule.new "A", 123 }

  describe "#price" do
    context "when the item matches" do
      it "returns the item's price" do
        subject.price("A").should == 123
      end
    end

    context "when the item does not match" do
      it "returns zero" do
        subject.price("B").should == 0
      end
    end
  end
end
