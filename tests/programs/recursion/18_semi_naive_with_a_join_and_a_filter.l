# Semi-naive evaluation with a join and a filter in the recursive rule.
# Expect: rows Reach = [("a", 0), ("b", 1), ("c", 2)]
Edge(from: "a", to: "b", ok: true);
Edge(from: "b", to: "c", ok: true);
Edge(from: "c", to: "d", ok: false);
@Recursive(Reach, 50);
@OrderBy(Reach, "node");
Reach(node: "a", hops: 0) distinct;
Reach(node: to, hops: h + 1) distinct :- Reach(node: from, hops: h), Edge(from:, to:, ok: true);
