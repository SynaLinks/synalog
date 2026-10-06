WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      CAST(ROW(2.0E0, ARRAY[1, 2]) AS ROW(m double, xs array(double))) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      CAST(ROW(null, ARRAY[]) AS ROW(m double, xs array(double))) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.id AS id,
  CARDINALITY(t_0_R.r.xs) AS n,
  t_0_R.r.m AS m
FROM
  t_1_R AS t_0_R ORDER BY id;