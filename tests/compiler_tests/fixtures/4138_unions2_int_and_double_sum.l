# Test: Summing a column of integers and doubles. (from tests/programs/unions2/int_and_double_sum.l)

U(v: 2);
U(v: 2.5);
Q(s? += v) distinct :- U(v:);
