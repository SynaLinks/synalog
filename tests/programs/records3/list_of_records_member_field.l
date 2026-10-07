# Rows whose list holds a record with a given field.
# Expect: rows Q = [(1,)]
T(k: 1, l: [{n: "a", v: 1}, {n: "b", v: 2}]);
T(k: 2, l: [{n: "c", v: 3}]);
Q(k:) distinct :- T(k:, l:), e in l, e.n == "b";
