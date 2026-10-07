# Split at commas, then joined again: the same text.
# Expect: rows Q = [(3, 'a,,b')]
Q(n: Size(Split("a,,b", ",")), s: Join(Split("a,,b", ","), ","));
