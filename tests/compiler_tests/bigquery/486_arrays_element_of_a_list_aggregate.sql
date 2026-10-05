WITH t_5_V AS (SELECT * FROM (
  
    SELECT
      2 AS k,
      "b" AS v
   UNION ALL
  
    SELECT
      1 AS k,
      "a" AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG(t_2_V.v order by [t_2_V.k][offset(0)]) AS l
FROM
  t_5_V AS t_2_V)
SELECT
  t_0_L.l[OFFSET(0)] AS first
FROM
  t_1_L AS t_0_L;