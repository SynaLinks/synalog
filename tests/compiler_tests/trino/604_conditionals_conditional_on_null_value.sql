WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      5 AS x
   UNION ALL
  
    SELECT
      2 AS k,
      null AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k,
  CASE WHEN (V.x IS null) THEN 'unset' ELSE 'set' END AS w
FROM
  t_0_V AS V ORDER BY k;