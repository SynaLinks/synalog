# The same string in a fact, matched by a filter.
# Expect: rows Q = [(1,)]
V(id: 1, s: "0x27 OR 1");
V(id: 2, s: "plain");
Q(id:) :- V(id:, s:), s == "0x27 OR 1";
