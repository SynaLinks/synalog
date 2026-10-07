# Test: Dates within a range. (from tests/programs/dates/07_between_two_dates.l)

V(d:) :- d in ["2024-01-31", "2024-02-15", "2024-03-01"];
D(d:) :- V(d:), d >= "2024-02-01", d < "2024-03-01";
