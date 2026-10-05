# The latest of ISO dates, compared as strings.
# Expect: rows A = [("2024-03-01",)]
V(d:) :- d in ["2023-12-31", "2024-03-01", "2024-01-15"];
A(m? Max= d) distinct :- V(d:);
