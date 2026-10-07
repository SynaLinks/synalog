# Test: The length of a null is null. (from tests/programs/strings3/length_of_null.l)

V(s: null);
Q(n: Length(s)) :- V(s:);
