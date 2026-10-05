# Test: Runs of consecutive days of east: their first and last day. (from tests/programs/analytics/islands_east.l)

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
D(d:) distinct :- S(r: "east", d:);
Start(d:) :- D(d:), ~D(d: d - 1);
End(d:) :- D(d:), ~D(d: d + 1);
@OrderBy(Q, "first", "last");
Q(first:, last? Min= e) distinct :- Start(d: first), End(d: e), e >= first;
