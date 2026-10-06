# Test: The Collatz sequence from 27 takes 111 steps to reach 1. (from tests/programs/recursion3/collatz_27_steps.l)

@Recursive(C, -1);
C(i: 0, x: 27) distinct;
C(i: i + 1, x: (if x % 2 == 0 then Div(x, 2) else 3 * x + 1)) distinct :- C(i:, x:), x != 1;
Q(n? Max= i) distinct :- C(i:);
