# A field of an element of a list of records.
# Expect: rows Q = [(1, "a"), (2, "c")]
T(k: 1, l: [{n: "a", v: 1}, {n: "b", v: 2}]);
T(k: 2, l: [{n: "c", v: 3}]);
@OrderBy(Q, "k");
Q(k:, n: Element(l, 0).n) :- T(k:, l:);
