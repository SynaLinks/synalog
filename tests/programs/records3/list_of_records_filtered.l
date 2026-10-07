# Unnested records filtered by a field.
# Expect: rows Q = [("b",), ("c",)]
T(k: 1, l: [{n: "a", v: 1}, {n: "b", v: 2}]);
T(k: 2, l: [{n: "c", v: 3}]);
@OrderBy(Q, "n");
Q(n: e.n) :- T(l:), e in l, e.v > 1;
