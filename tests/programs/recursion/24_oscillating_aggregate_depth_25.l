# An aggregate the recursion does not grow: each step takes the step before
# it, so 25 steps give exactly what 25 steps compute (1, 2, 3, 1, ...).
# Expect: rows C = [(2,)]
@Recursive(C, 25);
C(n? Max= 1) distinct;
C(n? Max= m + 1) distinct :- C(n: m), m < 3;
