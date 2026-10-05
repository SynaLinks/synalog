# Test: The month of each date, grouped. (from tests/programs/dates/02_month_of_a_date.l)

V(d:) :- d in ["2024-01-03", "2024-01-20", "2024-02-11"];
@OrderBy(M, "m");
M(m: Substr(d, 1, 7), n? += 1) distinct :- V(d:);
