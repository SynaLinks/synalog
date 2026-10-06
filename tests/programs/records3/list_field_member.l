# Membership in a list field.
# Expect: rows Q = [(1,)]
S(k: 1, r: {name: "a", xs: [1, 2, 3]});
S(k: 2, r: {name: "b", xs: [4]});
S(k: 3, r: {name: "c", xs: []});
Q(k:) :- S(k:, r:), 2 in r.xs;
