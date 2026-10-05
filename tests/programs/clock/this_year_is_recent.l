# Today's year is after 2025.
# Expect: rows Q = [(1,)]
Q(n? += 1) distinct :- Today(date:), ToInt64(Substr(date, 1, 4)) > 2025;
