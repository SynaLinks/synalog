# Test: Digits come before letters. (from tests/programs/strings3/digits_before_letters.l)

Q(a: x, b: y, c: z) :- x == "1", y == "A", z == "a", x < y, y < z;
