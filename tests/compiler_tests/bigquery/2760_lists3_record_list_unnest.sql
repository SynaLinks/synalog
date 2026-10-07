WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      STRUCT("a" AS name, ARRAY["x", "y"] AS tags) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      STRUCT("b" AS name, ARRAY[] AS tags) AS r
   UNION ALL
  
    SELECT
      3 AS id,
      STRUCT("c" AS name, ARRAY["y"] AS tags) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.id AS id,
  x_4 AS t
FROM
  t_1_R AS t_0_R, UNNEST(t_0_R.r.tags) as x_4 ORDER BY id NULLS LAST, t NULLS LAST;