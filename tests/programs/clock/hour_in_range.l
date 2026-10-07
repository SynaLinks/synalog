# Now's hour is a valid hour.
# Expect: rows Q = [(1,)]
Q(n? += 1) distinct :- Now(timestamp:), h == ToInt64(Substr(ToString(timestamp), 12, 2)), h >= 0, h <= 23;
