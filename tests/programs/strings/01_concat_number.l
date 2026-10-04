# Concatenating a number converted to text.
# Expect: rows S = [("n=42",)]
S(s: "n=" ++ ToString(42));
