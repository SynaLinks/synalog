WITH t_1_V AS (SELECT * FROM VALUES
  (1, 3, "ab"),
  (2, -4, "hello"),
  (3, 0, ""),
  (4, null, "x"),
  (5, 12, null),
  (6, 7, "seven")
AS UNUSED_TABLE_NAME(k, x, s)),
t_2_Rate AS (SELECT * FROM VALUES
  ("ab", 2),
  ("hello", 5),
  ("x", 10)
AS UNUSED_TABLE_NAME(s, r))
SELECT
  t_0_V.k AS k,
  Rate.r AS v
FROM
  t_1_V AS t_0_V, t_2_Rate AS Rate
WHERE
  (t_0_V.s = Rate.s) ORDER BY k NULLS LAST;