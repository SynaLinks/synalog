# Test: Strings of digits order as text. (from tests/programs/strings/46_string_ordering_of_digits.l)

@OrderBy(S, "s");
S(s:) :- s in ["2", "10", "1"];
