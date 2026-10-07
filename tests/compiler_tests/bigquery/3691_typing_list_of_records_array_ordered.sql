WITH t_4_V AS (SELECT * FROM (
  
    SELECT
      2 AS k,
      "a" AS n
   UNION ALL
  
    SELECT
      1 AS k,
      "b" AS n
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG(STRUCT(V.n AS n) order by [V.k][offset(0)]) AS l
FROM
  t_4_V AS V)
SELECT
  (CASE WHEN 0 < 0 THEN NULL ELSE t_0_L.l[SAFE_OFFSET(0)] END).n AS n
FROM
  t_1_L AS t_0_L;