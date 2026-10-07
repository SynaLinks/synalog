# Test: Splitting each row's text. (from tests/programs/arrays/22_size_of_a_split_column.l)

V(t:) :- t in ["a,b", "c"];
@OrderBy(A, "t");
A(t:, n: Size(Split(t, ","))) :- V(t:);
