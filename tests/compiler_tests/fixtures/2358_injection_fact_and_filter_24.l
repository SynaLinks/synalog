# Test: The same string in a fact, matched by a filter. (from tests/programs/injection/fact_and_filter_24.l)

V(id: 1, s: "'+(SELECT 1)+'");
V(id: 2, s: "plain");
Q(id:) :- V(id:, s:), s == "'+(SELECT 1)+'";
