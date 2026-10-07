# Splitting then joining with another separator.
# Expect: rows S = [("a-b-c",)]
S(v: Join(Split("a b c", " "), "-"));
