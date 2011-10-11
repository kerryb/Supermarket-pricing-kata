require_relative "../lib/checkout"

describe Checkout do
  subject { Checkout.new RULES }

  context "initially" do
    its(:total) { should == 0 }
  end

  describe "scanning an item" do
    before { RULES.stub(:price).with("A", subject).and_return 42 }
    before { RULES.stub(:price).with("B", subject).and_return 69 }

    it "increments the total according to the rules" do
      subject.scan "A"
      subject.total.should == 42
    end

    it "keeps track of the total" do
      subject.scan "A"
      subject.scan "B"
      subject.total.should == 111
    end

    it "keeps track of the number of each item bought" do
      subject.scan "A"
      subject.scan "A"
      subject.scan "B"
      subject.number_already_bought("A").should == 2
    end

    it "doesn't increment the number bought until after getting the price" do
      RULES.stub(:price) do |item, checkout|
        checkout.number_already_bought "A"
      end
      subject.scan "A"
      subject.total.should == 0
    end
  end
end
