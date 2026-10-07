# A closure over string nodes.
# Expect: rows R = [("a",), ("b",), ("c",)]
E(a: "a", b: "b");
E(a: "b", b: "c");
E(a: "x", b: "y");
@Recursive(R, 5);
@OrderBy(R, "n");
R(n: "a") distinct;
R(n: b) distinct :- R(n: a), E(a:, b:);
