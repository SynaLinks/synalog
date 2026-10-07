# Dates between 2000-01-01 and 2024-12-31, as text.
# Expect: rows Q = [(1,), (2,), (3,), (4,), (5,), (10,)]
Year(d) = ToInt64(Substr(d, 1, 4));
Month(d) = ToInt64(Substr(d, 6, 2));
Day(d) = ToInt64(Substr(d, 9, 2));
Leap(y) = (y % 4 == 0 && y % 100 != 0) || y % 400 == 0;
Days(y, m, d) = 365 * (y - 1970) + Div(y - 1969, 4) - Div(y - 1901, 100) + Div(y - 1601, 400) + (if m > 2 && Leap(y) then 1 else 0) + Element([0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334], m - 1) + d - 1;
DaysOf(s) = Days(Year(s), Month(s), Day(s));
Pad2(n) = Lpad(ToString(n), 2, "0");
V(id: 1, d: "2024-01-01");
V(id: 2, d: "2024-02-28");
V(id: 3, d: "2024-02-29");
V(id: 4, d: "2023-03-01");
V(id: 5, d: "2000-12-31");
V(id: 6, d: "1999-07-15");
V(id: 7, d: "2026-10-06");
V(id: 8, d: "1970-01-01");
V(id: 9, d: "2100-02-28");
V(id: 10, d: "2004-08-09");
@OrderBy(Q, "id");
Q(id:) :- V(id:, d:), d >= "2000-01-01", d <= "2024-12-31";
