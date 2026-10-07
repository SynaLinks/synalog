# Test: A string that looks like SQL is a value: it comes back unchanged. (from tests/programs/injection/value_16.l)

Q(s: "' || (SELECT 1) || '");
