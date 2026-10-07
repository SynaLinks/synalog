# Split at commas, then joined again: the same text.
# Expect: rows Q = [(1, 'x')]
Q(n: Size(Split("x", ",")), s: Join(Split("x", ","), ","));
