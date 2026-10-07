# The highest number on the way from 27.
# Expect: rows Q = [(9232,)]
@Recursive(C, -1);
C(i: 0, x: 27) distinct;
C(i: i + 1, x: (if x % 2 == 0 then Div(x, 2) else 3 * x + 1)) distinct :- C(i:, x:), x != 1;
Q(m? Max= x) distinct :- C(x:);
