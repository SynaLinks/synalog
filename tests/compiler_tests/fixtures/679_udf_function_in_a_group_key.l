# Test: Grouping by a function's value. (from tests/programs/udf/21_function_in_a_group_key.l)

SizeName(x) = (if x > 5 then "big" else "small");
V(x:) :- x in [1, 7, 9];
@OrderBy(S, "s");
S(s: SizeName(x), n? += 1) distinct :- V(x:);
