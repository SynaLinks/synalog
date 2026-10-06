# Joining what a conditional chose.
# Expect: rows Q = [(1, ""), (2, "a,b")]
V(k: 1);
V(k: 2);
@OrderBy(Q, "k");
Q(k:, s: Join((if k == 1 then [] else ["a", "b"]), ",")) :- V(k:);
