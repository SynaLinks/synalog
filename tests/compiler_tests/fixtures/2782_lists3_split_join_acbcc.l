# Test: Split at commas, then joined again: the same text. (from tests/programs/lists3/split_join_acbcc.l)

Q(n: Size(Split("a,b,c", ",")), s: Join(Split("a,b,c", ","), ","));
