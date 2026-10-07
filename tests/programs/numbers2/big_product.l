# A product past 32 bits, made 64-bit with ToInt64.
# Expect: rows Q = [(12884901888,)]
Q(v: ToInt64(65536) * 65536 * 3);
