WITH t_4_V AS (SELECT * FROM (
  
    SELECT
      'b' AS w
   UNION ALL
  
    SELECT
      'a' AS w
   UNION ALL
  
    SELECT
      'B' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG(V.w order by V.w) AS l
FROM
  t_4_V AS V)
SELECT
  ARRAY_JOIN(t_0_L.l, ',') AS s
FROM
  t_1_L AS t_0_L;