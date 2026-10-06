# Test: Records unnested from a list. (from tests/programs/records3/list_of_records_unnested.l)

T(k: 1, l: [{n: "a", v: 1}, {n: "b", v: 2}]);
T(k: 2, l: [{n: "c", v: 3}]);
@OrderBy(Q, "k", "n");
Q(k:, n: e.n, v: e.v) :- T(k:, l:), e in l;
