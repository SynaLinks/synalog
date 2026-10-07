# Test: The empty text is not null. (from tests/programs/strings3/empty_is_not_null.l)

V(s: "");
Q(x: 1, n: Length(s)) :- V(s:), s is not null;
