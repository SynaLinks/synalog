# A function over substrings.
# Expect: rows S = [("AL",)]
Initials(a, b) = Substr(a, 1, 1) ++ Substr(b, 1, 1);
S(v: Initials("Ada", "Lovelace"));
