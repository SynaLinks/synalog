# Test: Whether day 4 of east beats the days present next to it. (from tests/programs/analytics/is_peak_east_day_4.l)

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
Prev(d:, p? Max= e) distinct :- S(r: "east", d:), S(r: "east", d: e), e < d;
Next(d:, n? Min= e) distinct :- S(r: "east", d:), S(r: "east", d: e), e > d;
Lower(d:) :- Prev(d:, p:), S(r: "east", d:, v:), S(r: "east", d: p, v: w), w >= v;
Lower(d:) :- Next(d:, n:), S(r: "east", d:, v:), S(r: "east", d: n, v: w), w >= v;
Q(ok: 1) :- S(r: "east", d: 4), ~Lower(d: 4);
