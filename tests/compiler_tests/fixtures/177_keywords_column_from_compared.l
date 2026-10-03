# Test: Comparisons on a column named from. (from tests/programs/keywords/05_column_from_compared.l)

P(from: "2026-01-01");
P(from: "2026-02-01");
Later(from:) :- P(from:), from > "2026-01-15";
