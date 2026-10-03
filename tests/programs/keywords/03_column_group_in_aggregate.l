# Grouping by a column named group.
# Expect: rows T = [("a", 3), ("b", 4)]
R(group: "a", v: 1);
R(group: "a", v: 2);
R(group: "b", v: 4);
@OrderBy(T, "group");
T(group:, total? += v) distinct :- R(group:, v:);
