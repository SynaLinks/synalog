# Strings compare lexicographically.
# Expect: rows Early = [("2026-01-05",)]
D(d:) :- d in ["2026-01-05", "2026-03-01"];
Early(d:) :- D(d:), d < "2026-02-01";
