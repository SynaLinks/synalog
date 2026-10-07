# Test: Strings compare lexicographically. (from tests/programs/execution/60_comparison_of_strings.l)

D(d:) :- d in ["2026-01-05", "2026-03-01"];
Early(d:) :- D(d:), d < "2026-02-01";
