# Test: A column given an integer by one rule and a double by another. (from tests/programs/unions2/int_and_double.l)

U(k: 1, v: 2);
U(k: 2, v: 2.5);
@OrderBy(Q, "k");
Q(k:, v:) :- U(k:, v:);
