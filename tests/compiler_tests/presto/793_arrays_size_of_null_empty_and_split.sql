WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      '' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      'a,b' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      null AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k,
  CARDINALITY(SPLIT(V.s, ',')) AS n
FROM
  t_0_V AS V ORDER BY k;