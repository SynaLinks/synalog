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
  (CASE WHEN 0 < 0 THEN NULL ELSE t_0_L.l[SAFE_OFFSET(0)] END) AS first
FROM
  t_1_L AS t_0_L;