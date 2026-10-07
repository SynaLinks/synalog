# Test: A function with a condition. (from tests/programs/functions2/discounted_4_30.l)

Total(q, p) = if q * p >= 100 then q * p * 0.9 else q * p;
Q(t: Total(4, 30));
