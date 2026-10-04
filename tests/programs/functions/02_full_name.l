# A function of strings.
# Expect: rows R = [("Ada Lovelace",)]
FullName(first, last) = first ++ " " ++ last;
R(r: FullName("Ada", "Lovelace"));
