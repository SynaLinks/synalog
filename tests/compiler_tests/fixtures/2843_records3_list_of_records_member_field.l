# Test: Rows whose list holds a record with a given field. (from tests/programs/records3/list_of_records_member_field.l)

T(k: 1, l: [{n: "a", v: 1}, {n: "b", v: 2}]);
T(k: 2, l: [{n: "c", v: 3}]);
Q(k:) distinct :- T(k:, l:), e in l, e.n == "b";
