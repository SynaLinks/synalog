WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      STRUCT(ARRAY() AS xs) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      STRUCT(ARRAY("z") AS xs) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.k AS k,
  ARRAY_SIZE(t_0_R.r.xs) AS n
FROM
  t_1_R AS t_0_R ORDER BY k NULLS LAST;