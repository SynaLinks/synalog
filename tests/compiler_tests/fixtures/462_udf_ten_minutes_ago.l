# Test: TenMinutesAgo of the temporal guide, across midnight. (from tests/programs/udf/10_ten_minutes_ago.l)

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
TenMinutesAgo(ts) = ndate ++ " " ++ Pad2(nhh) ++ ":" ++ Pad2(nmm) ++ ":" ++ ss :-
  date == Substr(ts, 1, 10),
  hh == ToInt64(Substr(ts, 12, 2)),
  mm == ToInt64(Substr(ts, 15, 2)),
  ss == Substr(ts, 18, 2),
  nmm == (if mm >= 10 then mm - 10 else mm + 50),
  hh1 == (if mm >= 10 then hh else hh - 1),
  nhh == (if hh1 < 0 then 23 else hh1),
  ndate == (if hh1 < 0 then Yesterday(date) else date);
S(a: TenMinutesAgo("2024-01-01 00:05:00"), b: TenMinutesAgo("2024-05-06 08:00:09"));
