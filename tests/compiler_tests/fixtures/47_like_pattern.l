# Test: Like pattern matching

Names(name: "alice");
Names(name: "alan");
Names(name: "bob");
Names(name: "albert");

# Prefix match with % wildcard
@OrderBy(StartsWithAl, "name");
StartsWithAl(name:) :- Names(name:), Like(name, "al%");

# Single-char wildcard with _
@OrderBy(ThreeLetters, "name");
ThreeLetters(name:) :- Names(name:), Like(name, "___");

@OrderBy(Test, "name");
Test(name:) :- StartsWithAl(name:);
