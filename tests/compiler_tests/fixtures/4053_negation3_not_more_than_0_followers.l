# Test: People without more than 0 followers: a negated aggregate. (from tests/programs/negation3/not_more_than_0_followers.l)

U(u: "ann", age: 31);
U(u: "bob", age: 25);
U(u: "cid", age: 40);
U(u: "dee", age: 19);
U(u: "eve", age: 52);
U(u: "fay", age: 28);
U(u: "gus", age: 35);
F(a: "ann", b: "bob");
F(a: "bob", b: "ann");
F(a: "bob", b: "cid");
F(a: "cid", b: "dee");
F(a: "dee", b: "cid");
F(a: "eve", b: "ann");
F(a: "fay", b: "fay");
F(a: "ann", b: "cid");
Popular(u: b) distinct :- C(b:, n:), n > 0;
C(b:, n? += 1) distinct :- F(b:);
@OrderBy(Q, "u");
Q(u:) :- U(u:), ~Popular(u:);
