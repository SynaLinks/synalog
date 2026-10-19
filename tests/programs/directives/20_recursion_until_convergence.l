# -1 recurses until nothing changes: synalog runs it to its fixpoint, and
# compile() writes it as one recursive query, which stops when a step adds no
# new row.
# Expect: valid
# Expect: rows Reach = [(0,), (1,), (2,), (3,), (4,), (5,), (6,), (7,), (8,), (9,), (10,)]
Next(x:, y: x + 1) :- x in Range(10);
@Recursive(Reach, -1);
@OrderBy(Reach, "y");
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
