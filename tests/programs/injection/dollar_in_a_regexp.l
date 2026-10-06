# A dollar anchors a regular expression, as on every engine.
# Expect: rows Q = [(1,)]
V(id: 1, s: "ab");
V(id: 2, s: "ba");
Q(id:) :- V(id:, s:), RegexpContains(s, "b$");
