# Test: A closure over string nodes. (from tests/programs/recursion/47_closure_with_string_nodes.l)

E(a: "a", b: "b");
E(a: "b", b: "c");
E(a: "x", b: "y");
@Recursive(R, 5);
@OrderBy(R, "n");
R(n: "a") distinct;
R(n: b) distinct :- R(n: a), E(a:, b:);
