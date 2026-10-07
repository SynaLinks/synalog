WITH t_1_Data AS (SELECT * FROM VALUES
  (1, 2, 3, "x"),
  (4, 5, 6, "y"),
  (7, 8, 9, "z")
AS UNUSED_TABLE_NAME(a, b, c, d)),
t_0_Subset AS (SELECT
  Data.c AS c,
  Data.d AS d
FROM
  t_1_Data AS Data ORDER BY d NULLS LAST)
SELECT
  Subset.c AS c,
  Subset.d AS d
FROM
  t_0_Subset AS Subset ORDER BY d NULLS LAST;