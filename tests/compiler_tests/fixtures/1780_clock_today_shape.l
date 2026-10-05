# Test: Today is YYYY-MM-DD. (from tests/programs/clock/today_shape.l)

Q(n: Length(date), a: Substr(date, 5, 1), b: Substr(date, 8, 1)) :- Today(date:);
