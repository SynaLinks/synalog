# Test: Now's hour is a valid hour. (from tests/programs/clock/hour_in_range.l)

Q(n? += 1) distinct :- Now(timestamp:), h == ToInt64(Substr(ToString(timestamp), 12, 2)), h >= 0, h <= 23;
