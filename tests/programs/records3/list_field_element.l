# An element of a list field.
# Expect: rows Q = [(1, 2), (2, None), (3, None)]
S(k: 1, r: {name: "a", xs: [1, 2, 3]});
S(k: 2, r: {name: "b", xs: [4]});
S(k: 3, r: {name: "c", xs: []});
@OrderBy(Q, "k");
Q(k:, e: Element(r.xs, 1)) :- S(k:, r:);
