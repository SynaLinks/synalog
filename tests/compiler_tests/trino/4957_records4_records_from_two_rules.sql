WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      CAST(ROW('x', ARRAY[1]) AS ROW(a varchar, l array(double))) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      CAST(ROW(null, ARRAY[]) AS ROW(a varchar, l array(double))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.k AS k,
  t_0_R.r.a AS a,
  CARDINALITY(t_0_R.r.l) AS n
FROM
  t_1_R AS t_0_R ORDER BY k;