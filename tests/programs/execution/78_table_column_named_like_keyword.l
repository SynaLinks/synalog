# A value from a column named after a keyword, used in a join and a filter.
# Expect: rows Paid = [(10,)]
Line(order: 10, select: "paid");
Line(order: 11, select: "open");
Paid(order:) :- Line(order:, select: "paid");
