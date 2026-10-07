# A countdown written as text.
# Expect: rows Q = [("5 4 3 2 1",)]
@Recursive(C, -1);
C(n: 5, s: "5") distinct;
C(n: n - 1, s: s ++ " " ++ ToString(n - 1)) distinct :- C(n:, s:), n > 1;
Q(s:) :- C(n: 1, s:);
