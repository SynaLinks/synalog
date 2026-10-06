# Test: A column that starts a small integer and grows past 2^31. (from tests/programs/recursion3/integer_becomes_bigint.l)

@Recursive(S, -1);
S(i: 0, v: 1) distinct;
S(i: i + 1, v: ToInt64(v) * 2) distinct :- S(i:, v:), i < 32;
Q(v:) :- S(i: 32, v:);
