# The year of a date as a number.
# Expect: rows Y = [(2025,)]
Y(y: ToInt64(Substr("2024-06-01", 1, 4)) + 1);
