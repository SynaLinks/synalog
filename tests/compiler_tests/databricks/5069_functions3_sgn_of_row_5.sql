WITH t_1_V AS (SELECT * FROM VALUES
  (1, 3, "ab"),
  (2, -4, "hello"),
  (3, 0, ""),
  (4, null, "x"),
  (5, 12, null),
  (6, 7, "seven")
AS UNUSED_TABLE_NAME(k, x, s))
SELECT
  CASE WHEN (t_0_V.x > 0) THEN 1 WHEN (t_0_V.x < 0) THEN -1 ELSE 0 END AS v
FROM
  t_1_V AS t_0_V
WHERE
  (t_0_V.k = 5);