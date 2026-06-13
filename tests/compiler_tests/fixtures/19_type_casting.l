# Test: Type casting

Numbers(x) :- x in Range(5);

# ToString
StringNum(x, str) :- Numbers(x), str == ToString(x);

# ToInt64
ParsedNum(s, num) :- s in ["1", "2", "3"], num == ToInt64(s);

# ToFloat64
FloatNum(x, f) :- Numbers(x), f == ToFloat64(x);

# Round and Floor
Rounded(x, r, f) :- Numbers(x), x > 0, r == Round(x * 1.5), f == Floor(x * 1.5);

@OrderBy(Test, "col0");
Test(x, str) :- StringNum(x, str);
