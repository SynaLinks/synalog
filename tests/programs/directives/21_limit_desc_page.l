# @Limit with a descending order, then a page of it.
# Expect: rows Top = [(5,), (4,), (3,)]
# Expect: page Top 2 1 = [(4,), (3,)]
V(x:) :- x in [1, 2, 3, 4, 5];
@OrderBy(Top, "x DESC");
@Limit(Top, 3);
Top(x:) :- V(x:);
