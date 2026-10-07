# A recursion building strings.
# Expect: rows W = [("a",), ("aa",), ("aaa",)]
@Recursive(W, 5);
@OrderBy(W, "w");
W(w: "a") distinct;
W(w: w ++ "a") distinct :- W(w:), Length(w) < 3;
