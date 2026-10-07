# if/then/else in a body.
# Expect: valid
# Expect: rows Size = [(1, "small"), (50, "medium"), (500, "large")]

Item(x:) :- x in [1, 50, 500];
@OrderBy(Size, "x");
Size(x:, size:) :- Item(x:), size == (if x > 100 then "large" else if x > 10 then "medium" else "small");
