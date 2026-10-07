# Splitting then joining 'abc' gives it back.
# Expect: rows Q = [('abc',)]
Q(s: Join(Split("abc", ","), ","));
