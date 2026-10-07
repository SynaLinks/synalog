# Test: if/then/else in a body. (from tests/programs/verifier/13_conditional.l)

Item(x:) :- x in [1, 50, 500];
@OrderBy(Size, "x");
Size(x:, size:) :- Item(x:), size == (if x > 100 then "large" else if x > 10 then "medium" else "small");
