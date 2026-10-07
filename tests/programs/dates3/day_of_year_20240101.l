# The day of the year of 2024-01-01.
# Expect: rows Q = [(1,)]
Year(d) = ToInt64(Substr(d, 1, 4));
Month(d) = ToInt64(Substr(d, 6, 2));
Day(d) = ToInt64(Substr(d, 9, 2));
Leap(y) = (y % 4 == 0 && y % 100 != 0) || y % 400 == 0;
Days(y, m, d) = 365 * (y - 1970) + Div(y - 1969, 4) - Div(y - 1901, 100) + Div(y - 1601, 400) + (if m > 2 && Leap(y) then 1 else 0) + Element([0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334], m - 1) + d - 1;
DaysOf(s) = Days(Year(s), Month(s), Day(s));
Pad2(n) = Lpad(ToString(n), 2, "0");
Q(n: DaysOf("2024-01-01") - Days(2024, 1, 1) + 1);
