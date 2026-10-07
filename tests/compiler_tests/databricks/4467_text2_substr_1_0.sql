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
  W.k AS k,
  SUBSTR(W.s, 1, 0) AS v
FROM
  t_0_W AS W ORDER BY k NULLS LAST;