# Test: Array operations

# Array literal
Colors() = ["red", "green", "blue"];

# Iterating over array
Color(c) :- c in Colors();

# Element access
FirstColor() = Element(Colors(), 0);
SecondColor() = Element(Colors(), 1);

# In expression as function
InColors(c:, is_primary:) :- Color(c), is_primary == (c in ["red", "blue", "yellow"]);

@OrderBy(Test, "c");
Test(c:, is_primary:) :- InColors(c:, is_primary:);
