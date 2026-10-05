# A minus right after an operator negates its operand.
# Expect: rows A = [(-6, 5, 16, -3)]
A(a: 2 * -3, b: 2 - -3, c: 10 - -2 * 3, d: -(1 - 2) * -3);
