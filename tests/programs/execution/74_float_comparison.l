# 0.1 + 0.2 compared with a tolerance.
# Expect: rows R = [(1,)]
R(x: 1) :- Abs(0.1 + 0.2 - 0.3) < 0.000001;
