# Test: The empty string sorts first. (from tests/programs/strings/49_compare_empty_strings.l)

@OrderBy(S, "s");
S(s:) :- s in ["a", ""];
