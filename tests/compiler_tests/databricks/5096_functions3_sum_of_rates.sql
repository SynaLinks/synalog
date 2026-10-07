WITH t_0_V AS (SELECT * FROM VALUES
  (1, 3, "ab"),
  (2, -4, "hello"),
  (3, 0, ""),
  (4, null, "x"),
  (5, 12, null),
  (6, 7, "seven")
AS UNUSED_TABLE_NAME(k, x, s)),
t_1_Rate AS (SELECT * FROM VALUES
  ("ab", 2),
  ("hello", 5),
  ("x", 10)
AS UNUSED_TABLE_NAME(s, r))
SELECT
  SUM(Rate.r) AS t
FROM
  t_0_V AS V, t_1_Rate AS Rate
WHERE
  (V.s = Rate.s);