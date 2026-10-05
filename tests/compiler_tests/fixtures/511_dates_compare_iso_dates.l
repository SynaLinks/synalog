# Test: ISO dates compare as text. (from tests/programs/dates/01_compare_iso_dates.l)

V(d:) :- d in ["2023-12-31", "2024-02-01", "2024-03-15"];
@OrderBy(D, "d");
D(d:) :- V(d:), d >= "2024-01-01";
