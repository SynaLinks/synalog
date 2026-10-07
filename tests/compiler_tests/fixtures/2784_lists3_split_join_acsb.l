# Test: Split at commas, then joined again: the same text. (from tests/programs/lists3/split_join_acsb.l)

Q(n: Size(Split("a, b", ",")), s: Join(Split("a, b", ","), ","));
