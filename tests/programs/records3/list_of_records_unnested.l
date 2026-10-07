# Records unnested from a list.
# Expect: rows Q = [(1, "a", 1), (1, "b", 2), (2, "c", 3)]
T(k: 1, l: [{n: "a", v: 1}, {n: "b", v: 2}]);
T(k: 2, l: [{n: "c", v: 3}]);
@OrderBy(Q, "k", "n");
Q(k:, n: e.n, v: e.v) :- T(k:, l:), e in l;
