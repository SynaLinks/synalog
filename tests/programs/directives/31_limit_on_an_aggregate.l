# The two largest groups.
# Expect: rows A = [("c", 3), ("a", 2)]
V(g:) :- g in ["a", "a", "b", "c", "c", "c"];
@OrderBy(A, "n desc");
@Limit(A, 2);
A(g:, n? += 1) distinct :- V(g:);
