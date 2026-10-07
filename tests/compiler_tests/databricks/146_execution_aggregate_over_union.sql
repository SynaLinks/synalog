WITH t_0_P AS (SELECT * FROM VALUES
  ("a", 1),
  ("a", 2),
  ("a", 3)
AS UNUSED_TABLE_NAME(k, v))
SELECT
  P.k AS k,
  SUM(P.v) AS t
FROM
  t_0_P AS P
GROUP BY 1;