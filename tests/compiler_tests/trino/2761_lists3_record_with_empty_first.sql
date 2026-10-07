WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      CAST(ROW(ARRAY[]) AS ROW(xs array(varchar))) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      CAST(ROW(ARRAY['z']) AS ROW(xs array(varchar))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.k AS k,
  CARDINALITY(t_0_R.r.xs) AS n
FROM
  t_1_R AS t_0_R ORDER BY k;