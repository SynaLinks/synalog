# Test: Joining a null list is null. (from tests/programs/lists3/null_list_joined.l)

V(l: null);
Q(s: Join(l, ",")) :- V(l:);
