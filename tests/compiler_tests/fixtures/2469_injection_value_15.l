# Test: A string that looks like SQL is a value: it comes back unchanged. (from tests/programs/injection/value_15.l)

Q(s: "');ATTACH DATABASE 'x' AS y;--");
