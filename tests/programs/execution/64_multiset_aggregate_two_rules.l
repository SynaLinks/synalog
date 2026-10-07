# A Sum aggregate built from two rules for the same group.
# Expect: rows Total = [("a", 5)]
Total(k: "a", t? += 2) distinct;
Total(k: "a", t? += 3) distinct;
