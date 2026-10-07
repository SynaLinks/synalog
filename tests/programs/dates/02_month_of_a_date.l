# The month of each date, grouped.
# Expect: rows M = [("2024-01", 2), ("2024-02", 1)]
V(d:) :- d in ["2024-01-03", "2024-01-20", "2024-02-11"];
@OrderBy(M, "m");
M(m: Substr(d, 1, 7), n? += 1) distinct :- V(d:);
