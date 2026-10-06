# Test: A field summed over unnested records. (from tests/programs/records3/list_of_records_summed.l)

T(k: 1, l: [{n: "a", v: 1}, {n: "b", v: 2}]);
T(k: 2, l: [{n: "c", v: 3}]);
@OrderBy(Q, "k");
Q(k:, t? += e.v) distinct :- T(k:, l:), e in l;
