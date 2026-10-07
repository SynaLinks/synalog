# Split at commas, then joined again: the same text.
# Expect: rows Q = [(3, 'a,b,c')]
Q(n: Size(Split("a,b,c", ",")), s: Join(Split("a,b,c", ","), ","));
