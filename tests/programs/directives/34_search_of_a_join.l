# A search over a joined predicate.
# Expect: search J ^p = [(1, "paris")]
A(k: 1, c: "paris");
A(k: 2, c: "lyon");
B(k:) :- k in [1, 2];
@OrderBy(J, "k");
J(k:, c:) :- A(k:, c:), B(k:);
