WITH t_2_V AS (SELECT * FROM VALUES
  (1, 3, "ab"),
  (2, -4, "hello"),
  (3, 0, ""),
  (4, null, "x"),
  (5, 12, null),
  (6, 7, "seven")
AS UNUSED_TABLE_NAME(k, x, s)),
t_3_Rate AS (SELECT * FROM VALUES
  ("ab", 2),
  ("hello", 5),
  ("x", 10)
AS UNUSED_TABLE_NAME(s, r))
SELECT
  V.k AS k,
  V.s AS s,
  t_1_Rate.r AS r
FROM
  t_2_V AS V, t_3_Rate AS Rate, t_3_Rate AS t_1_Rate
WHERE
  (Rate.r IS NOT null) AND
  (V.s = Rate.s) AND
  (V.s = t_1_Rate.s) ORDER BY k NULLS LAST;