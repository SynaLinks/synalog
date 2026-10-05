# Test: Rows per year. (from tests/programs/dates/06_count_per_year.l)

V(d:) :- d in ["2024-01-01", "2023-05-05", "2024-12-31"];
@OrderBy(Y, "y");
Y(y: Substr(d, 1, 4), n? += 1) distinct :- V(d:);
