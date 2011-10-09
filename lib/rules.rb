require_relative "rule_set"
require_relative "simple_rule"
require_relative "quantity_discount_rule"

RULES = RuleSet.new(
  QuantityDiscountRule.new("A", 50, 3, 130),
  QuantityDiscountRule.new("B", 30, 2, 45),
  SimpleRule.new("C", 20),
  SimpleRule.new("D", 15),
)
