# Test: A string that looks like SQL is a value: it comes back unchanged. (from tests/programs/injection/value_03.l)

Q(s: "') UNION SELECT 1 --");
