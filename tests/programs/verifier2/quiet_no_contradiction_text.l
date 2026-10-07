# No warning: no contradiction text.
# Expect: valid
# Expect: quiet
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(s:) :- N(s:), s > "a", s < "z";
