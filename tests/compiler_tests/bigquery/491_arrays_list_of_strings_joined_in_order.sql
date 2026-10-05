WITH t_4_V AS (SELECT * FROM (
  
    SELECT
      3 AS k,
      "c" AS v
   UNION ALL
  
    SELECT
      1 AS k,
      "a" AS v
   UNION ALL
  
    SELECT
      2 AS k,
      "b" AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG(t_2_V.v order by [t_2_V.k][offset(0)]) AS l
FROM
  t_4_V AS t_2_V)
SELECT
  ARRAY_TO_STRING(t_0_L.l, "-") AS s
FROM
  t_1_L AS t_0_L;