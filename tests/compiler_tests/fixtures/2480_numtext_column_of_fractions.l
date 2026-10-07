# Test: A column of fractions as text, the same on every engine. (from tests/programs/numtext/column_of_fractions.l)

V(k: 1, x: 0.1);
V(k: 2, x: 1 / 3);
V(k: 3, x: 4 / 2);
V(k: 4, x: 1e6);
@OrderBy(Q, "k");
Q(k:, s: ToString(x)) :- V(k:, x:);
