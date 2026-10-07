WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      CAST(ROW(1, 'a') AS ROW(k double, s varchar)) AS r
   UNION ALL
  
    SELECT
      CAST(ROW(2, 'b') AS ROW(k double, s varchar)) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.r.s AS s
FROM
  t_0_V AS V
WHERE
  (V.r.k > 1);