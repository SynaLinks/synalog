# Test: An empty list in a column that a collected list of numbers also fills. (from tests/programs/combine4/collected_list_typed_for_an_empty_one.l)

A(x: 1);
A(x: 2);
L(src: "a", l? List= x) distinct :- A(x:);
M(src: "b", l: []);
All(src:, l:) :- L(src:, l:);
All(src:, l:) :- M(src:, l:);
@OrderBy(Q, "src");
Q(src:, n: Size(l)) :- All(src:, l:);
