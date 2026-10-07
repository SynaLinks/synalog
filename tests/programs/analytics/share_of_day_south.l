# Each day's share of south's total, in percent.
# Expect: rows Q = [(1, 31.818182), (2, 31.818182), (4, 9.090909), (5, 27.272727)]
S(r: "north", d: 1, v: 5);
S(r: "north", d: 2, v: 8);
S(r: "north", d: 3, v: 3);
S(r: "north", d: 5, v: 9);
S(r: "north", d: 6, v: 1);
S(r: "south", d: 1, v: 7);
S(r: "south", d: 2, v: 7);
S(r: "south", d: 4, v: 2);
S(r: "south", d: 5, v: 6);
S(r: "east", d: 2, v: 4);
S(r: "east", d: 3, v: 11);
S(r: "east", d: 4, v: 6);
S(r: "east", d: 5, v: 10);
S(r: "east", d: 7, v: 3);
T(t? += v) distinct :- S(r: "south", v:);
@OrderBy(Q, "d", "pct");
Q(d:, pct: Round(100 * v / t, 6)) :- S(r: "south", d:, v:), T(t:);
