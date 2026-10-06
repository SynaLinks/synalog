# Test: A relation may have a built-in function's name: it is never called. (from tests/programs/records3/relation_named_count.l)

Count(x: 1);
Count(x: 2);
@OrderBy(Q, "x");
Q(x:) :- Count(x:);
