# Test: The length of the month of 1999-07-15. (from tests/programs/dates3/month_length_of_19990715.l)

Year(d) = ToInt64(Substr(d, 1, 4));
Month(d) = ToInt64(Substr(d, 6, 2));
Day(d) = ToInt64(Substr(d, 9, 2));
Leap(y) = (y % 4 == 0 && y % 100 != 0) || y % 400 == 0;
Days(y, m, d) = 365 * (y - 1970) + Div(y - 1969, 4) - Div(y - 1901, 100) + Div(y - 1601, 400) + (if m > 2 && Leap(y) then 1 else 0) + Element([0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334], m - 1) + d - 1;
DaysOf(s) = Days(Year(s), Month(s), Day(s));
Pad2(n) = Lpad(ToString(n), 2, "0");
MonthLength(y, m) = (if m == 2 then (if Leap(y) then 29 else 28) else Element([31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], m - 1));
Q(n: MonthLength(Year("1999-07-15"), Month("1999-07-15")));
