# Test: Format's placeholders: padded integers (after the sign), a precision, alignment and a literal percent, the same on every engine. (from tests/programs/strings/28_format_specifiers.l)

S(a: Format("%05d", -42), b: Format("%.2f", 3.14159), c: Format("%3s|%-3s|", "a", "b"),
  d: Format("100%%"), e: Format("%d", 1234567));
