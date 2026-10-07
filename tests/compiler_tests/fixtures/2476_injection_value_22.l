# Test: A string that looks like SQL is a value: it comes back unchanged. (from tests/programs/injection/value_22.l)

Q(s: "’; DROP TABLE t; --");
