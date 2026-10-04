# An aggregate the recursion does not grow: each step takes the step before
# it, so 2 steps give exactly what 2 steps compute (1, 2, 3, 1, ...).
# Expect: rows C = [(3,)]
@Recursive(C, 2);
C(n? Max= 1) distinct;
C(n? Max= m + 1) distinct :- C(n: m), m < 3;
