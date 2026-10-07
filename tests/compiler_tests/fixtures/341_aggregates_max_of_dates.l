# Test: The latest of ISO dates, compared as strings. (from tests/programs/aggregates/12_max_of_dates.l)

V(d:) :- d in ["2023-12-31", "2024-03-01", "2024-01-15"];
A(m? Max= d) distinct :- V(d:);
