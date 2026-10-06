WITH t_1_N AS (SELECT * FROM VALUES
  (1, "x"),
  (2, "y"),
  (3, "z")
AS UNUSED_TABLE_NAME(n, s))
SELECT
  UPPER(t_0_N.s) AS u,
  LENGTH(t_0_N.s) AS l
FROM
  t_1_N AS t_0_N ORDER BY u NULLS LAST;