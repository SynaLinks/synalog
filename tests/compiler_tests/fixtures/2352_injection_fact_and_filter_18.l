# Test: The same string in a fact, matched by a filter. (from tests/programs/injection/fact_and_filter_18.l)

V(id: 1, s: "\x27; DROP TABLE t");
V(id: 2, s: "plain");
Q(id:) :- V(id:, s:), s == "\x27; DROP TABLE t";
