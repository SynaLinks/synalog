# Test: The size of a null list is null. (from tests/programs/lists3/size_of_null.l)

V(l: null);
Q(n: Size(l)) :- V(l:);
