WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      0.1 AS x
   UNION ALL
  
    SELECT
      2 AS k,
      (CAST(1 AS REAL) / NULLIF(3, 0)) AS x
   UNION ALL
  
    SELECT
      3 AS k,
      (CAST(4 AS REAL) / NULLIF(2, 0)) AS x
   UNION ALL
  
    SELECT
      4 AS k,
      1e6 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k,
  SYNALOG_NUMBER_TEXT(V.x) AS s
FROM
  t_0_V AS V ORDER BY k NULLS LAST;