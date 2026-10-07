# Joining case-insensitively through Upper.
# Expect: rows S = [("Paris", "FR")]
A(c: "Paris");
B(c: "PARIS", k: "FR");
S(c:, k:) :- A(c:), B(c: u, k:), Upper(c) == u;
