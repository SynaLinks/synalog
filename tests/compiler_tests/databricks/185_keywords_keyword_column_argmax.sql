WITH t_2_S AS (SELECT * FROM (
  
    SELECT
      1 AS `order`,
      5 AS s
   UNION ALL
  
    SELECT
      2 AS `order`,
      9 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(t_0_S.s AS value, t_0_S.`order` AS arg)), false)[0].arg AS `order`
FROM
  t_2_S AS t_0_S;