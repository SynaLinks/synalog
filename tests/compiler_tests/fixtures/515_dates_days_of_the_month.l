# Test: The day part of dates, as numbers. (from tests/programs/dates/05_days_of_the_month.l)

V(d:) :- d in ["2024-01-31", "2024-02-01"];
@OrderBy(D, "day");
D(day: ToInt64(Substr(d, 9, 2))) :- V(d:);
