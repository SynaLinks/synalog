# Splitting then joining '' gives it back.
# Expect: rows Q = [('',)]
Q(s: Join(Split("", ","), ","));
