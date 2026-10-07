# Each day's share of north's total, in percent.
# Expect: rows Q = [(1, 19.230769), (2, 30.769231), (3, 11.538462), (5, 34.615385), (6, 3.846154)]
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
T(t? += v) distinct :- S(r: "north", v:);
@OrderBy(Q, "d", "pct");
Q(d:, pct: Round(100 * v / t, 6)) :- S(r: "north", d:, v:), T(t:);
