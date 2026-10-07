WITH t_0_W AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      2 AS x
   UNION ALL
  
    SELECT
      2 AS k,
      3 AS x
   UNION ALL
  
    SELECT
      3 AS k,
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W.k AS k,
  CASE WHEN (W.k = 3) THEN ((W.x) * (2)) ELSE ((W.x) * (W.x)) END AS v
FROM
  t_0_W AS W ORDER BY k;