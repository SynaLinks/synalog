# An aggregate the recursion does not grow: each step takes the step before
# it, so 3 steps give exactly what 3 steps compute (1, 2, 3, 1, ...).
# Expect: rows C = [(1,)]
@Recursive(C, 3);
C(n? Max= 1) distinct;
C(n? Max= m + 1) distinct :- C(n: m), m < 3;
