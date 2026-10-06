# The date 30 days after 1970-01-01, back from the days since the epoch.
# Expect: rows Q = [('1970-01-31',)]
Year(d) = ToInt64(Substr(d, 1, 4));
Month(d) = ToInt64(Substr(d, 6, 2));
Day(d) = ToInt64(Substr(d, 9, 2));
Leap(y) = (y % 4 == 0 && y % 100 != 0) || y % 400 == 0;
Days(y, m, d) = 365 * (y - 1970) + Div(y - 1969, 4) - Div(y - 1901, 100) + Div(y - 1601, 400) + (if m > 2 && Leap(y) then 1 else 0) + Element([0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334], m - 1) + d - 1;
DaysOf(s) = Days(Year(s), Month(s), Day(s));
Pad2(n) = Lpad(ToString(n), 2, "0");
Civil(z) = {y: yy + (if m <= 2 then 1 else 0), m:, d:} :- z2 == z + 719468, era == Div(z2 - (if z2 >= 0 then 0 else 146096), 146097), doe == z2 - era * 146097, yoe == Div(doe - Div(doe, 1460) + Div(doe, 36524) - Div(doe, 146096), 365), yy == yoe + era * 400, doy == doe - (365 * yoe + Div(yoe, 4) - Div(yoe, 100)), mp == Div(5 * doy + 2, 153), d == doy - Div(153 * mp + 2, 5) + 1, m == mp + (if mp < 10 then 3 else -9);
Q(s: ToString(c.y) ++ "-" ++ Pad2(c.m) ++ "-" ++ Pad2(c.d)) :- c == Civil(DaysOf("1970-01-01") + 30);
