# Test: columns named after SQL keywords are quoted, also in ORDER BY

Line(order: 10, group: "a", select: 1);
Line(order: 11, group: "b", select: 2);

@OrderBy(Test, "order DESC");
Test(order:, group:, total? += select) distinct :- Line(order:, group:, select:);
