# 0.1 + 0.2 is within a tolerance of 0.3.
# Expect: rows A = [(True,)]
A(close: Abs(0.1 + 0.2 - 0.3) < 0.000000001);
