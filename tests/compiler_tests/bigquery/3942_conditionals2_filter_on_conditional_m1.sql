WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      5 AS x,
      "a" AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -3 AS x,
      null AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      "c" AS s
   UNION ALL
  
    SELECT
      4 AS k,
      null AS x,
      "d" AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      null AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      "f" AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k
FROM
  t_0_V AS V
WHERE
  (CASE WHEN (V.x < 0) THEN 0 WHEN (V.x > 10) THEN 10 ELSE V.x END > -1) ORDER BY k;