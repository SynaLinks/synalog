# Test: Keeping multiples of three. (from tests/programs/numbers/06_modulo_in_a_filter.l)

@OrderBy(N, "x");
N(x:) :- x in Range(10), x % 3 == 0, x > 0;
