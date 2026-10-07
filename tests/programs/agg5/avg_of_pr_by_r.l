# avg of pr per r, null keys their own group, null values skipped.
# Expect: rows Q = [('east', 2.0), ('north', 7.5), ('south', 7.5), ('west', 10.0), (None, 5.0)]
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
Q(k: r, v? Avg= pr) distinct :- S(r:, pr:);
