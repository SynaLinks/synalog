# Format with a zero-padded width.
# Expect: rows S = [("00042",)]
S(v: Format("%05d", 42));
