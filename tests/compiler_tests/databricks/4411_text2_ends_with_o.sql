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
  (LENGTH("o") <= LENGTH(W.s) AND SUBSTR(W.s, LENGTH(W.s) - LENGTH("o") + 1, LENGTH("o")) = "o") AS v
FROM
  t_0_W AS W ORDER BY k NULLS LAST;