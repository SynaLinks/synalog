# Format's placeholders: padded integers (after the sign), a precision,
# alignment and a literal percent, the same on every engine.
# Expect: rows S = [("-0042", "3.14", "  a|b  |", "100%", "1234567")]
S(a: Format("%05d", -42), b: Format("%.2f", 3.14159), c: Format("%3s|%-3s|", "a", "b"),
  d: Format("100%%"), e: Format("%d", 1234567));
