# A function with a condition.
# Expect: rows Q = [(108.0,)]
Total(q, p) = if q * p >= 100 then q * p * 0.9 else q * p;
Q(t: Total(4, 30));
