# Test: The same string in a fact, matched by a filter. (from tests/programs/injection/fact_and_filter_03.l)

V(id: 1, s: "') UNION SELECT 1 --");
V(id: 2, s: "plain");
Q(id:) :- V(id:, s:), s == "') UNION SELECT 1 --";
