# Split at commas, then joined again: the same text.
# Expect: rows Q = [(1, '')]
Q(n: Size(Split("", ",")), s: Join(Split("", ","), ","));
