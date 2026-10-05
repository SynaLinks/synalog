# Test: A function with a condition. (from tests/programs/functions2/discounted_6_30.l)

Total(q, p) = if q * p >= 100 then q * p * 0.9 else q * p;
Q(t: Total(6, 30));
