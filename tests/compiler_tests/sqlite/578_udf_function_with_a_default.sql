WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      1 AS x
   UNION ALL
  
    SELECT
      2 AS k,
      null AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.k AS k,
  COALESCE(t_0_V.x, 0) AS v
FROM
  t_1_V AS t_0_V ORDER BY k NULLS LAST;