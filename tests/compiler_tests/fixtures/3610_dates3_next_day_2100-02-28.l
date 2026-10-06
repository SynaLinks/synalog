# Test: The day after 2100-02-28. (from tests/programs/dates3/next_day_2100-02-28.l)

Year(d) = ToInt64(Substr(d, 1, 4));
Month(d) = ToInt64(Substr(d, 6, 2));
Day(d) = ToInt64(Substr(d, 9, 2));
Leap(y) = (y % 4 == 0 && y % 100 != 0) || y % 400 == 0;
Days(y, m, d) = 365 * (y - 1970) + Div(y - 1969, 4) - Div(y - 1901, 100) + Div(y - 1601, 400) + (if m > 2 && Leap(y) then 1 else 0) + Element([0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334], m - 1) + d - 1;
DaysOf(s) = Days(Year(s), Month(s), Day(s));
Pad2(n) = Lpad(ToString(n), 2, "0");
MonthLength(y, m) = (if m == 2 then (if Leap(y) then 29 else 28) else Element([31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], m - 1));
Next(y, m, d) = (if d < MonthLength(y, m) then {y:, m:, d: d + 1} else if m < 12 then {y:, m: m + 1, d: 1} else {y: y + 1, m: 1, d: 1});
Q(s: ToString(n.y) ++ "-" ++ Pad2(n.m) ++ "-" ++ Pad2(n.d)) :- n == Next(2100, 2, 28);
