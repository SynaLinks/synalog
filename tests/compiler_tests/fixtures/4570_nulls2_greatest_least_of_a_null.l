# Test: Greatest and Least are null when an argument is null, on every engine. (from tests/programs/nulls2/greatest_least_of_a_null.l)

Gv(a: 1, b: null);
Gv(a: 2, b: 5);
@OrderBy(Q, "a");
Q(a:, g: Greatest(a, b), l: Least(a, b), h: Greatest(a, 2.5, Coalesce(b, 0))) :- Gv(a:, b:);
