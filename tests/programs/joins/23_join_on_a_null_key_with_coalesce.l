# Matching null keys through a default.
# Expect: rows J = [("none",)]
A(k: null);
B(k: "none");
J(k:) :- A(k: a), B(k:), Coalesce(a, "none") == k;
