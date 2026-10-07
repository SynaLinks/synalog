# Test: Upper of a null is null. (from tests/programs/strings3/upper_of_null.l)

V(s: null);
Q(t: Upper(s)) :- V(s:);
