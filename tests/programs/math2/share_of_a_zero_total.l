# A share of a total of zero has no value; the query still runs.
# Expect: rows Q = [("a", None), ("b", 0.25)]
T(g: "a", x: 0);
T(g: "b", x: 1);
T(g: "b", x: 3);
S(g:, t? += x) distinct :- T(g:, x:);
@OrderBy(Q, "g");
M(g:, m? Min= x) distinct :- T(g:, x:);
Q(g:, share: m / t) :- M(g:, m:), S(g:, t:);
