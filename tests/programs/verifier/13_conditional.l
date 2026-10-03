# if/then/else in a body.
# Expect: valid

Item(x:) :- x in [1, 50, 500];
Size(x:, size:) :- Item(x:), size == (if x > 100 then "large" else if x > 10 then "medium" else "small");
