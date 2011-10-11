class RuleSet
  def initialize *rules
    @rules = rules
  end

  def price item, checkout
    @rules.map{|r| r.price item, checkout }.reduce(0, &:+)
  end
end
