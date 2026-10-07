# The median value of south, by counting.
# Expect: rows Q = [(6.5,)]
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
V(d:, v:) :- S(r: "south", d:, v:);
N(n? += 1) distinct :- V(d:);
Before(d:, e:) distinct :- V(d:, v:), V(d: e, v: w), w < v | V(d:, v:), V(d: e, v: w), w == v, e < d;
Pos(d:, v:, pos: Coalesce(b, 0)) :- V(d:, v:), b == (combine += 1 :- Before(d:, e:));
Mid(v:) :- Pos(v:, pos:), N(n:), 2 * pos + 1 == n | Pos(v:, pos:), N(n:), 2 * pos == n | Pos(v:, pos:), N(n:), 2 * pos + 2 == n;
Q(m? Avg= v) distinct :- Mid(v:);
