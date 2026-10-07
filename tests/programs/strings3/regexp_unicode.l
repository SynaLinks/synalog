# A regular expression over accented text.
# Expect: rows Q = [("caf",)]
Q(s: RegexpExtract("café", "[a-z]+"));
