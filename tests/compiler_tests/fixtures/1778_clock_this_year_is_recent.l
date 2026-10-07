# Test: Today's year is after 2025. (from tests/programs/clock/this_year_is_recent.l)

Q(n? += 1) distinct :- Today(date:), ToInt64(Substr(date, 1, 4)) > 2025;
