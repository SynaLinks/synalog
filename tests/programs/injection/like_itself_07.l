# A string matched as a Like pattern of itself, wildcards escaped.
# Expect: rows Q = [(1,)]
V(id: 1, s: "a\");
V(id: 2, s: "plain");
Q(id:) :- V(id:, s:), Like(s, "a\\");
