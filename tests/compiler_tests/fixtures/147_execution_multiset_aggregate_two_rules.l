# Test: A Sum aggregate built from two rules for the same group. (from tests/programs/execution/64_multiset_aggregate_two_rules.l)

Total(k: "a", t? += 2) distinct;
Total(k: "a", t? += 3) distinct;
