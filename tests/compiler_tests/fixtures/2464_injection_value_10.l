# Test: A string that looks like SQL is a value: it comes back unchanged. (from tests/programs/injection/value_10.l)

Q(s: "'; COMMIT; DROP TABLE t; --");
