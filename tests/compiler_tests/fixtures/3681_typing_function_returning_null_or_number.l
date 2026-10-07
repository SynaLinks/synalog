# Test: A function giving a null or a number. (from tests/programs/typing/function_returning_null_or_number.l)

Half(x) = (if x % 2 == 0 then x / 2 else null);
V(x: 1);
V(x: 4);
@OrderBy(Q, "x");
Q(x:, h: Half(x)) :- V(x:);
