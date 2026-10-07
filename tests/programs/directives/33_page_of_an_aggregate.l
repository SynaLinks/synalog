# A page of grouped rows.
# Expect: page A 1 1 = [("b", 1)]
V(g:) :- g in ["a", "a", "b", "c"];
@OrderBy(A, "g");
A(g:, n? += 1) distinct :- V(g:);
