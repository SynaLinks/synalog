# Splitting then joining '1|2|3' gives it back.
# Expect: rows Q = [('1|2|3',)]
Q(s: Join(Split("1|2|3", "|"), "|"));
