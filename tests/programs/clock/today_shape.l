# Today is YYYY-MM-DD.
# Expect: rows Q = [(10, "-", "-")]
Q(n: Length(date), a: Substr(date, 5, 1), b: Substr(date, 8, 1)) :- Today(date:);
