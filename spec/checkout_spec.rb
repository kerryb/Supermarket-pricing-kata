require_relative "../lib/checkout"

describe Checkout do
  subject { Checkout.new RULES }

  context "initially" do
    its(:total) { should == 0 }
  end

  describe "scanning an item" do
    before { RULES.stub(:price).with("A").and_return 42 }
    before { RULES.stub(:price).with("B").and_return 69 }

    it "increments the total according to the rules" do
      subject.scan "A"
      subject.total.should == 42
    end

    it "keeps track of the total" do
      subject.scan "A"
      subject.scan "B"
      subject.total.should == 111
    end
  end
end
