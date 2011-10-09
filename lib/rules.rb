require_relative "rule_set"
require_relative "simple_rule"

RULES = RuleSet.new(
  SimpleRule.new("A", 50),
  SimpleRule.new("B", 30),
  SimpleRule.new("C", 20),
  SimpleRule.new("D", 15),
)
