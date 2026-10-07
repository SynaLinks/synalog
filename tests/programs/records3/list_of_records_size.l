# The size of a list of records.
# Expect: rows Q = [(1, 2), (2, 1)]
T(k: 1, l: [{n: "a", v: 1}, {n: "b", v: 2}]);
T(k: 2, l: [{n: "c", v: 3}]);
@OrderBy(Q, "k");
Q(k:, s: Size(l)) :- T(k:, l:);
