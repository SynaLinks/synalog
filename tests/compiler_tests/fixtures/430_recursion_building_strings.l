# Test: A recursion building strings. (from tests/programs/recursion/30_building_strings.l)

@Recursive(W, 5);
@OrderBy(W, "w");
W(w: "a") distinct;
W(w: w ++ "a") distinct :- W(w:), Length(w) < 3;
