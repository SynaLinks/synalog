# Test: Splitting then joining 'a b  c' gives it back. (from tests/programs/strings2/split_join_axbxxc_space.l)

Q(s: Join(Split("a b  c", " "), " "));
