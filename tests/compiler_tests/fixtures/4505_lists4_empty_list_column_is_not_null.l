# Test: An empty list is not null. (from tests/programs/lists4/empty_list_column_is_not_null.l)

E(k: 1, l: []);
Q(k:, n: l is null, s: Size(l)) :- E(k:, l:);
