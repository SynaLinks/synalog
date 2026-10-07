# Text and numbers concatenated.
# Expect: rows Q = [("n=3 x=2.5",)]
Q(s: "n=" ++ ToString(3) ++ " x=" ++ ToString(2.5));
