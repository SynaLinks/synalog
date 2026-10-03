# Comparisons on a column named from.
# Expect: rows Later = [("2026-02-01",)]
P(from: "2026-01-01");
P(from: "2026-02-01");
Later(from:) :- P(from:), from > "2026-01-15";
