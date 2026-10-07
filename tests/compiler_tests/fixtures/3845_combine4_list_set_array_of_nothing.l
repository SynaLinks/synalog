# Test: A list, a set and an ordered list of no rows are null. (from tests/programs/combine4/list_set_array_of_nothing.l)

E(x: 1);
Q(l: (combine List= x :- E(x:), x > 5), s: (combine Set= x :- E(x:), x > 5), a: (combine Array= x -> x :- E(x:), x > 5));
