# A function calling another.
# Expect: rows S = [(12,)]
Double(x) = 2 * x;
Quad(x) = Double(Double(x));
S(v: Quad(3));
