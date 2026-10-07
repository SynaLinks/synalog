# A field summed over unnested records.
# Expect: rows Q = [(1, 3), (2, 3)]
T(k: 1, l: [{n: "a", v: 1}, {n: "b", v: 2}]);
T(k: 2, l: [{n: "c", v: 3}]);
@OrderBy(Q, "k");
Q(k:, t? += e.v) distinct :- T(k:, l:), e in l;
