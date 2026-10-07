WITH t_3_V AS (SELECT * FROM (
  
    SELECT
      "a" AS n,
      1 AS v
   UNION ALL
  
    SELECT
      "b" AS n,
      2 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG(STRUCT(t_2_V.n AS n, t_2_V.v AS v)) AS l
FROM
  t_3_V AS t_2_V)
SELECT
  x_1.n AS n,
  x_1.v AS v
FROM
  t_1_L AS t_0_L, UNNEST(t_0_L.l) as x_1 ORDER BY n NULLS LAST;