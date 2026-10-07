# Test: A dollar anchors a regular expression, as on every engine. (from tests/programs/injection/dollar_in_a_regexp.l)

V(id: 1, s: "ab");
V(id: 2, s: "ba");
Q(id:) :- V(id:, s:), RegexpContains(s, "b$");
