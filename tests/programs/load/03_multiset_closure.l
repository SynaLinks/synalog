# The ancestors of every node of a binary tree of 4095 nodes, by a
# recursion that is not distinct: its rows are a multiset, compared with
# their counts at every step to tell whether it has converged. The tree has
# one path from a node to each ancestor, so the counts stop changing after
# 11 steps, well before the declared depth.
# Expect: rows Pairs = [(40962,)]
# Expect: within 60
Edge(child: 2 * p, parent: p) :- p in Range(2048), p > 0;
Edge(child: 2 * p + 1, parent: p) :- p in Range(2048), p > 0;
# The tree is computed once into a table, as stored data would be.
@Ground(Edge);
@Recursive(Ancestor, 50);
Ancestor(node: c, ancestor: p) :- Edge(child: c, parent: p);
Ancestor(node: c, ancestor: a) :- Edge(child: c, parent: m), Ancestor(node: m, ancestor: a);
Pairs(n? += 1) distinct :- Ancestor();
