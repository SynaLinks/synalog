# Test: Integers past 32 bits: integer literals are 32-bit on several engines, ToInt64 makes the arithmetic 64-bit everywhere. (from tests/programs/arithmetic/05_large_integers.l)

A(v: ToInt64(1024) * 1024 * 1024 * 1024, w: ToInt64(2147483647) + 1);
