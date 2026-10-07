# Test: An empty list concatenated with a list of numbers from another predicate. (from tests/programs/typing/empty_list_concat_numbers.l)

A(l: []);
B(l: [1, 2]);
Q(n: Size(ArrayConcat(a, b))) :- A(l: a), B(l: b);
