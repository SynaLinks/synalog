WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      CAST(ROW(ARRAY[], 'a') AS ROW(l array(double), n varchar)) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      CAST(ROW(ARRAY[7, 8], 'b') AS ROW(l array(double), n varchar)) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.k AS k,
  t_0_R.r.n AS n,
  CARDINALITY(t_0_R.r.l) AS c
FROM
  t_1_R AS t_0_R ORDER BY k;