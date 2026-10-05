# Test: Concatenating an array with an empty one. (from tests/programs/arrays/14_concat_with_empty.l)

V(l: [1, 2]);
A(n: Size(ArrayConcat(l, []))) :- V(l:);
