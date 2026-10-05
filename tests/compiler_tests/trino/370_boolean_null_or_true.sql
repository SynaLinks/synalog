WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      null AS x
   UNION ALL
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      5 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x
FROM
  t_0_V AS V
WHERE
  ((V.x IS null) OR (V.x > 1)) ORDER BY x NULLS FIRST;