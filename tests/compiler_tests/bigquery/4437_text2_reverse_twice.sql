WITH t_0_W AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      "naïve" AS s
   UNION ALL
  
    SELECT
      2 AS k,
      "" AS s
   UNION ALL
  
    SELECT
      3 AS k,
      null AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W.k AS k,
  REVERSE(REVERSE(W.s)) AS v,
  REVERSE(W.s) AS r
FROM
  t_0_W AS W ORDER BY k;