# A function of two columns.
# Expect: rows S = [(1, 2, 5), (3, 4, 25)]
SumSq(a, b) = a * a + b * b;
V(a: 1, b: 2);
V(a: 3, b: 4);
@OrderBy(S, "a");
S(a:, b:, s: SumSq(a, b)) :- V(a:, b:);
