# Test: Joining case-insensitively through Upper. (from tests/programs/strings/50_upper_in_a_join_key.l)

A(c: "Paris");
B(c: "PARIS", k: "FR");
S(c:, k:) :- A(c:), B(c: u, k:), Upper(c) == u;
