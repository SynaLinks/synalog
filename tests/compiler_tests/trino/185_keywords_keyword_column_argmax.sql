WITH t_2_S AS (SELECT * FROM (
  
    SELECT
      1 AS "order",
      5 AS s
   UNION ALL
  
    SELECT
      2 AS "order",
      9 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (ARRAY_AGG(t_0_S."order" order by t_0_S.s desc))[1] AS "order"
FROM
  t_2_S AS t_0_S;