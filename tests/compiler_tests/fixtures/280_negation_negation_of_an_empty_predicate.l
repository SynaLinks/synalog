# Test: Negating a predicate without rows keeps everything. (from tests/programs/negation/05_negation_of_an_empty_predicate.l)

V(x:) :- x in [1, 2];
None(x:) :- V(x:), x > 10;
@OrderBy(Out, "x");
Out(x:) :- V(x:), ~None(x:);
