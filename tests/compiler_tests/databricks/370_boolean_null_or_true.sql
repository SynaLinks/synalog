WITH t_0_V AS (SELECT * FROM VALUES
  (null),
  (1),
  (5)
AS UNUSED_TABLE_NAME(x))
SELECT
  V.x AS x
FROM
  t_0_V AS V
WHERE
  ((V.x IS null) OR (V.x > 1)) ORDER BY x NULLS FIRST;