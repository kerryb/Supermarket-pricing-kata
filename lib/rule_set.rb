class RuleSet
  def initialize *rules
    @rules = rules
  end

  def price item
    @rules.map{|r| r.price item }.reduce(0, &:+)
  end
end
