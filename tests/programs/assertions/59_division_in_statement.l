# Division in a statement, on floats.
# Expect: holds Half.definition
@Assert(Half, definition: "∀ k, Half k = Whole k / 2");
Whole(k: "a", v: 3.0);
Half(k: "a", v: 1.5);
