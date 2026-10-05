WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG(DISTINCT V.x) AS l
FROM
  t_2_V AS V)
SELECT
  SIZE(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L;