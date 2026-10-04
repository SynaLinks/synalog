# An aggregate the recursion does not grow: each step takes the step before
# it, so 24 steps give exactly what 24 steps compute (1, 2, 3, 1, ...).
# Expect: rows C = [(1,)]
@Recursive(C, 24);
C(n? Max= 1) distinct;
C(n? Max= m + 1) distinct :- C(n: m), m < 3;
