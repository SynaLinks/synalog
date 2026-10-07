# @Limit keeps the first rows in order.
# Expect: rows Top = [(9,), (7,)]
V(x:) :- x in [4, 1, 9, 7];
@OrderBy(Top, "x DESC");
@Limit(Top, 2);
Top(x:) :- V(x:);
