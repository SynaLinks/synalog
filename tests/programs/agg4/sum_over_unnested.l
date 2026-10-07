# A sum over the elements of lists.
# Expect: rows Q = [("a", 6), ("b", 10)]
L(k: "a", l: [1, 2, 3]);
L(k: "b", l: [10]);
@OrderBy(Q, "k", "t");
Q(k:, t? += x) distinct :- L(k:, l:), x in l;
