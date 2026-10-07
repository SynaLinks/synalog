# Until convergence on a tree.
# Expect: rows Below = [("a",), ("b",), ("c",), ("d",)]
Child(p: "root", c: "a");
Child(p: "a", c: "b");
Child(p: "b", c: "c");
Child(p: "a", c: "d");
@Recursive(Below, -1);
@OrderBy(Below, "n");
Below(n: c) distinct :- Child(p: "root", c:);
Below(n: c) distinct :- Below(n: p), Child(p:, c:);
