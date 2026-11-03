# The ancestors of every node of a binary tree of 4095 nodes, 11 levels
# deep: 40962 rows, half of them holding a null tag. A distinct recursion is
# evaluated semi-naively, a step keeping the rows not found yet; a row holding
# a null must be found like any other, or every step adds it again and the
# recursion never converges.
# Expect: rows Pairs = [(40962,)]
# Expect: rows NullPairs = [(20481,)]
# Expect: within 120
Edge(child: 2 * p, parent: p) :- p in Range(2048), p > 0;
Edge(child: 2 * p + 1, parent: p) :- p in Range(2048), p > 0;
Tag(node: n, tag: n % 7) :- n in Range(4096), n > 0, n % 2 == 0;
Tag(node: n, tag: ToInt64(null)) :- n in Range(4096), n > 0, n % 2 == 1;
# The tree is computed once into tables, as stored data would be.
@Ground(Edge);
@Ground(Tag);
@Recursive(Ancestor, -1);
Ancestor(node: c, ancestor: p, tag:) distinct :- Edge(child: c, parent: p), Tag(node: c, tag:);
Ancestor(node: c, ancestor: a, tag:) distinct :-
  Edge(child: c, parent: m), Tag(node: c, tag:), Ancestor(node: m, ancestor: a);
Pairs(n? += 1) distinct :- Ancestor();
NullPairs(n? += 1) distinct :- Ancestor(tag:), tag is null;
