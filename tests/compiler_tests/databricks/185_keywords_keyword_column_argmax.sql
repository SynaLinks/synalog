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
  SORT_ARRAY(COLLECT_LIST(STRUCT(S.s AS value, S.`order` AS arg)), false)[0].arg AS `order`
FROM
  t_1_S AS S;