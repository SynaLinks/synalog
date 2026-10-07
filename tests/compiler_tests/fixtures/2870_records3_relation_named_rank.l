# Test: A relation may have a built-in function's name: it is never called. (from tests/programs/records3/relation_named_rank.l)

Rank(x: 1);
Rank(x: 2);
@OrderBy(Q, "x");
Q(x:) :- Rank(x:);
