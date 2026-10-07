WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      STRUCT("a" AS name, ARRAY[STRUCT(1 AS v), STRUCT(2 AS v)] AS xs) AS r
   UNION ALL
  
    SELECT
      STRUCT("b" AS name, ARRAY[STRUCT(5 AS v)] AS xs) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.r.name AS name,
  x_1.v AS v
FROM
  t_1_R AS t_0_R, UNNEST(t_0_R.r.xs) as x_1 ORDER BY name NULLS LAST, v NULLS LAST;