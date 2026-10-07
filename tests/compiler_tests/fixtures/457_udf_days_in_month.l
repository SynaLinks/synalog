# Test: A function with a body (the leap-year rule of the temporal guide). (from tests/programs/udf/05_days_in_month.l)

DaysInMonth(y, m) = n :-
  leap == (if (y % 4 == 0) && ((y % 100 != 0) || (y % 400 == 0)) then 1 else 0),
  n == (if m == 2 then 28 + leap
        else if (m == 4) || (m == 6) || (m == 9) || (m == 11) then 30
        else 31);
S(a: DaysInMonth(2024, 2), b: DaysInMonth(2023, 2), c: DaysInMonth(2000, 2),
  d: DaysInMonth(1900, 2), e: DaysInMonth(2023, 4), f: DaysInMonth(2023, 12));
