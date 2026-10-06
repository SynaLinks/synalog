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
  t_0_L.l[OFFSET(0)].n AS n
FROM
  t_1_L AS t_0_L;