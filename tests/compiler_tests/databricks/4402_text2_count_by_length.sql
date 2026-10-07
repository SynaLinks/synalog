WITH t_0_W AS (SELECT * FROM VALUES
  (1, "Hello"),
  (2, " a "),
  (3, ""),
  (4, "aaa"),
  (5, null),
  (6, "hello world"),
  (7, "naïve"),
  (8, "lol")
AS UNUSED_TABLE_NAME(k, s))
SELECT
  LENGTH(W.s) AS l,
  SUM(1) AS n
FROM
  t_0_W AS W
WHERE
  (W.s IS NOT null)
GROUP BY 1 ORDER BY l NULLS LAST;