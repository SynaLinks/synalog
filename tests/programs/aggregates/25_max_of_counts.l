# The largest group size.
# Expect: rows A = [(3,)]
V(g:) :- g in ["a", "a", "a", "b", "c", "c"];
C(g:, n? += 1) distinct :- V(g:);
A(m? Max= n) distinct :- C(n:);
