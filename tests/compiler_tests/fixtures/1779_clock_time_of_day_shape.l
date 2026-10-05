# Test: The time of day has eight characters, colons at 3 and 6. (from tests/programs/clock/time_of_day_shape.l)

Q(n: Length(t), a: Substr(t, 3, 1), b: Substr(t, 6, 1)) :- Now(timestamp:), t == Substr(ToString(timestamp), 12, 8);
