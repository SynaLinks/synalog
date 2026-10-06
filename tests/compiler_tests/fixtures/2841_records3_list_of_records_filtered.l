# Test: Unnested records filtered by a field. (from tests/programs/records3/list_of_records_filtered.l)

T(k: 1, l: [{n: "a", v: 1}, {n: "b", v: 2}]);
T(k: 2, l: [{n: "c", v: 3}]);
@OrderBy(Q, "n");
Q(n: e.n) :- T(l:), e in l, e.v > 1;
