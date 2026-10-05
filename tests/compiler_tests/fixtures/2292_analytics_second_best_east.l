# Test: east's second best day (by value, then day). (from tests/programs/analytics/second_best_east.l)

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
Better(d:, n? += 1) distinct :- S(r: "east", d:, v:), S(r: "east", d: e, v: w), w > v | S(r: "east", d:, v:), S(r: "east", d: e, v: w), w == v, e < d;
Q(d:, v:) :- S(r: "east", d:, v:), Better(d:, n: 1);
