WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      STRUCT(ARRAY[1, 2] AS xs, 2.0 AS m) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      STRUCT(ARRAY[] AS xs, null AS m) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.id AS id,
  ARRAY_LENGTH(t_0_R.r.xs) AS n,
  t_0_R.r.m AS m
FROM
  t_1_R AS t_0_R ORDER BY id NULLS LAST;