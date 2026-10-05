# Joining on a conditional value.
# Expect: rows C = [(1, "odd"), (2, "even")]
V(x:) :- x in [1, 2];
Name(p: 0, n: "even");
Name(p: 1, n: "odd");
@OrderBy(C, "x");
C(x:, n:) :- V(x:), Name(p: (if x % 2 == 0 then 0 else 1), n:);
