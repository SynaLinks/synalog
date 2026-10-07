# Test: The year of a date as a number. (from tests/programs/dates/03_year_as_a_number.l)

Y(y: ToInt64(Substr("2024-06-01", 1, 4)) + 1);
