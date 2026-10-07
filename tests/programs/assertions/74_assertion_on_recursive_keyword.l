# An assertion about a recursive predicate named after a keyword.
# Expect: holds Select.bounded
@Assert(Select, bounded: "∀ x, Select x → x ≤ 3");
Edge(a: 1, b: 2);
Edge(a: 2, b: 3);
@Recursive(Select, 5);
Select(x: 1) distinct;
Select(x: b) distinct :- Select(x: a), Edge(a:, b:);
