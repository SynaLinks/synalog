# Split at commas, then joined again: the same text.
# Expect: rows Q = [(3, ',a,')]
Q(n: Size(Split(",a,", ",")), s: Join(Split(",a,", ","), ","));
