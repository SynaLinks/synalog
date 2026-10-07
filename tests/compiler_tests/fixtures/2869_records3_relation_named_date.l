# Test: A relation may have a built-in function's name: it is never called. (from tests/programs/records3/relation_named_date.l)

Date(x: 1);
Date(x: 2);
@OrderBy(Q, "x");
Q(x:) :- Date(x:);
