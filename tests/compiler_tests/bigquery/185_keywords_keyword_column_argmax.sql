WITH t_1_S AS (SELECT * FROM (
  
    SELECT
      1 AS `order`,
      5 AS s
   UNION ALL
  
    SELECT
      2 AS `order`,
      9 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ARRAY_AGG(S.`order` order by  [S.s][offset(0)] desc limit 1)[OFFSET(0)] AS `order`
FROM
  t_1_S AS S;