# count of q per region, of rows priced over 3.
# Expect: rows Q = [('north', 4), ('south', 1), ('west', 1), (None, 1)]
S(id: 1, r: "north", p: "ax", q: 3, pr: 10.0);
S(id: 2, r: "north", p: "ax", q: null, pr: 10.0);
S(id: 3, r: "north", p: "bo", q: 5, pr: 4.0);
S(id: 4, r: "south", p: "ax", q: 1, pr: 12.0);
S(id: 5, r: "south", p: "cy", q: 7, pr: null);
S(id: 6, r: "south", p: "cy", q: 2, pr: 3.0);
S(id: 7, r: "east", p: "bo", q: null, pr: null);
S(id: 8, r: null, p: "ax", q: 4, pr: 9.0);
S(id: 9, r: null, p: "dz", q: 6, pr: 1.0);
S(id: 10, r: "east", p: "dz", q: 8, pr: 2.0);
S(id: 11, r: "north", p: "cy", q: 3, pr: 6.0);
S(id: 12, r: "west", p: "ax", q: 9, pr: 10.0);
@OrderBy(Q, "k");
Q(k: r, v? += 1) distinct :- S(r:, q:, pr:), pr > 3;
