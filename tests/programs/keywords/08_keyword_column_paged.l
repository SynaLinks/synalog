# Paging through rows ordered by a keyword column.
# Expect: page R 2 1 = [(2,), (3,)]
@OrderBy(R, "order");
R(order:) :- order in [2, 3, 1, 4];
