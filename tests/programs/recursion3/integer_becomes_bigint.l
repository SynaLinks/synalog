# A column that starts a small integer and grows past 2^31.
# Expect: rows Q = [(4294967296,)]
@Recursive(S, -1);
S(i: 0, v: 1) distinct;
S(i: i + 1, v: ToInt64(v) * 2) distinct :- S(i:, v:), i < 32;
Q(v:) :- S(i: 32, v:);
