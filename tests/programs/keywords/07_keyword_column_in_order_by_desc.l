# ORDER BY a keyword column, descending.
# Expect: rows R = [(3,), (2,), (1,)]
@OrderBy(R, "order DESC");
R(order:) :- order in [2, 3, 1];
