# Test: A function returning text from a number. (from tests/programs/udf/20_function_with_a_conditional_and_text.l)

Ordinal(n) = ToString(n) ++ (if n == 1 then "st" else if n == 2 then "nd" else "th");
V(n:) :- n in [1, 2, 4];
@OrderBy(S, "n");
S(n:, o: Ordinal(n)) :- V(n:);
