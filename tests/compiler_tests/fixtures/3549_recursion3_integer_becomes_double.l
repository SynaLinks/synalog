# Test: A column that starts whole and gets a fraction in the recursion. (from tests/programs/recursion3/integer_becomes_double.l)

@Recursive(S, -1);
S(i: 0, v: 0) distinct;
S(i: i + 1, v: v + 0.5) distinct :- S(i:, v:), i < 4;
Q(v:) :- S(i: 4, v:);
