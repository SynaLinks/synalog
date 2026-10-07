# The earliest date.
# Expect: rows D = [("2022-07-04",)]
V(d:) :- d in ["2024-01-01", "2022-07-04", "2023-03-03"];
D(d? Min= d) distinct :- V(d:);
