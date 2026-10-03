# Test: Grouping by a column named group. (from tests/programs/keywords/03_column_group_in_aggregate.l)

R(group: "a", v: 1);
R(group: "a", v: 2);
R(group: "b", v: 4);
@OrderBy(T, "group");
T(group:, total? += v) distinct :- R(group:, v:);
