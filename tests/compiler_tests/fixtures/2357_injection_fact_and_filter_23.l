# Test: The same string in a fact, matched by a filter. (from tests/programs/injection/fact_and_filter_23.l)

V(id: 1, s: "0x27 OR 1");
V(id: 2, s: "plain");
Q(id:) :- V(id:, s:), s == "0x27 OR 1";
