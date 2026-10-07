# A three-day moving average of east over the days present.
# Expect: rows Q = [(2, 4.0), (3, 7.5), (4, 7.0), (5, 9.0), (7, 6.5)]
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
@OrderBy(Q, "d", "a");
Q(d:, a? Avg= w) distinct :- S(r: "east", d:), S(r: "east", d: e, v: w), e <= d, e >= d - 2;
