WITH t_1_Data AS (SELECT * FROM VALUES
  (1, 2),
  (3, 1),
  (5, 5),
  (2, 4)
AS UNUSED_TABLE_NAME(a, b)),
t_0_Filtered AS (SELECT
  Data.a AS a,
  Data.b AS b
FROM
  t_1_Data AS Data
WHERE
  (Data.a >= Data.b) ORDER BY a NULLS LAST)
SELECT
  Filtered.a AS a,
  Filtered.b AS b
FROM
  t_0_Filtered AS Filtered ORDER BY a NULLS LAST;