# A function of two strings.
# Expect: rows S = [("Ada Lovelace",)]
FullName(first, last) = first ++ " " ++ last;
S(v: FullName("Ada", "Lovelace"));
