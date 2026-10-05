# The day part of dates, as numbers.
# Expect: rows D = [(1,), (31,)]
V(d:) :- d in ["2024-01-31", "2024-02-01"];
@OrderBy(D, "day");
D(day: ToInt64(Substr(d, 9, 2))) :- V(d:);
