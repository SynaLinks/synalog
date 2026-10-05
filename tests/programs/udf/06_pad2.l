# Zero-padding to two digits.
# Expect: rows S = [("05", "12")]
Pad2(x) = (if x < 10 then "0" ++ ToString(x) else ToString(x));
S(a: Pad2(5), b: Pad2(12));
