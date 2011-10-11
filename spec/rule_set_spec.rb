require_relative "../lib/rule_set"

describe RuleSet do
  describe "#price" do
    let(:checkout) { stub }
    let(:rule_1) { stub }
    let(:rule_2) { stub }
    subject { RuleSet.new rule_1, rule_2 }

    before do
      rule_1.stub(:price).with("A", checkout).and_return 30
      rule_2.stub(:price).with("A", checkout).and_return 12
    end

    it "returns the sum of prices returned by all rules" do
      subject.price("A", checkout).should == 42
    end

    context "when there are no rules" do
      it "returns zero" do
        RuleSet.new.price("A", checkout).should == 0
      end
    end
  end
end
