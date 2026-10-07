# A string with ${...} matched by a filter.
# Expect: rows Q = [(1,)]
V(id: 1, s: "${a}");
V(id: 2, s: "");
Q(id:) :- V(id:, s:), s == "${a}";
