# Test: A string that looks like SQL is a value: it comes back unchanged. (from tests/programs/injection/value_18.l)

Q(s: "\x27; DROP TABLE t");
