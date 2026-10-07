# Test: Splitting then joining 'a,b,c' gives it back. (from tests/programs/strings2/split_join_axbxc_comma.l)

Q(s: Join(Split("a,b,c", ","), ","));
