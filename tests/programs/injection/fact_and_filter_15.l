# The same string in a fact, matched by a filter.
# Expect: rows Q = [(1,)]
V(id: 1, s: "');ATTACH DATABASE 'x' AS y;--");
V(id: 2, s: "plain");
Q(id:) :- V(id:, s:), s == "');ATTACH DATABASE 'x' AS y;--";
