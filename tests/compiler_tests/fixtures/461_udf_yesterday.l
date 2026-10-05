# Test: The Yesterday function of the temporal guide, across month and year ends. (from tests/programs/udf/09_yesterday.l)

DaysInMonth(y, m) = n :-
  leap == (if (y % 4 == 0) && ((y % 100 != 0) || (y % 400 == 0)) then 1 else 0),
  n == (if m == 2 then 28 + leap
        else if (m == 4) || (m == 6) || (m == 9) || (m == 11) then 30
        else 31);
Pad2(x) = (if x < 10 then "0" ++ ToString(x) else ToString(x));
Yesterday(date) = ToString(py) ++ "-" ++ Pad2(pm) ++ "-" ++ Pad2(pd) :-
  y == ToInt64(Substr(date, 1, 4)),
  m == ToInt64(Substr(date, 6, 2)),
  d == ToInt64(Substr(date, 9, 2)),
  py == (if d > 1 then y else if m == 1 then y - 1 else y),
  pm == (if d > 1 then m else if m == 1 then 12 else m - 1),
  pd == (if d > 1 then d - 1 else DaysInMonth(py, pm));
S(a: Yesterday("2024-03-01"), b: Yesterday("2024-01-01"), c: Yesterday("2023-03-15"),
  d: Yesterday("2023-03-01"));
