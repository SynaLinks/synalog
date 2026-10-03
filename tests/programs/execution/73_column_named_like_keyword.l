# Columns named after SQL keywords.
# Expect: rows R = [(1, 2, 3)]
R(order: 1, group: 2, select: 3);
# Expect: rows Ordered = [(3, 1), (1, 2)]
@OrderBy(Ordered, "order DESC");
Ordered(order:, group:) :- R(order:, group:) | (order == 3, group == 1);
# Expect: search Ordered ^3 = [(3, 1)]
