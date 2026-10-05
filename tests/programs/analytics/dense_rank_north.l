# The dense rank of each day of north.
# Expect: rows Q = [(1, 3), (2, 2), (3, 4), (5, 1), (6, 5)]
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
Val(v:) distinct :- S(r: "north", v:);
@OrderBy(Q, "d", "rank");
Q(d:, rank: 1 + Coalesce(n, 0)) :- S(r: "north", d:, v:), n == (combine += 1 :- Val(v: w), w > v);
