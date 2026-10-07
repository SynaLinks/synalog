WITH t_1_W AS (SELECT * FROM VALUES
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
  W.k AS a,
  t_0_W.k AS b
FROM
  t_1_W AS W, t_1_W AS t_0_W
WHERE
  (W.k < t_0_W.k) AND
  (UPPER(W.s) = UPPER(t_0_W.s)) ORDER BY a NULLS LAST, b NULLS LAST;