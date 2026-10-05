# Shortest distances until they stop changing.
# Expect: rows D = [("a", 0), ("b", 1), ("c", 1), ("d", 2)]
E(a: "a", b: "b");
E(a: "b", b: "c");
E(a: "c", b: "d");
E(a: "a", b: "c");
E(a: "b", b: "d");
@Recursive(D, -1);
@OrderBy(D, "n");
D(n: "a", d? Min= 0) distinct;
D(n: b, d? Min= d + 1) distinct :- D(n: a, d:), E(a:, b:);
