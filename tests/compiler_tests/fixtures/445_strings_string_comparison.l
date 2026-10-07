# Test: Strings compare in order. (from tests/programs/strings/20_string_comparison.l)

W(w:) :- w in ["apple", "pear"];
S(w:) :- W(w:), w < "banana";
