# Test: A countdown written as text. (from tests/programs/recursion3/countdown_text.l)

@Recursive(C, -1);
C(n: 5, s: "5") distinct;
C(n: n - 1, s: s ++ " " ++ ToString(n - 1)) distinct :- C(n:, s:), n > 1;
Q(s:) :- C(n: 1, s:);
