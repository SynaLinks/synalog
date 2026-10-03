# Integer division vs a cast to float.
# Expect: rows Ratio = [(0.5,)]
Ratio(r: ToFloat64(1) / ToFloat64(2));
