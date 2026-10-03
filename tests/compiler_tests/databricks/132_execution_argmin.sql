WITH t_1_Price AS (SELECT * FROM (
  
    SELECT
      "pen" AS item,
      1 AS p
   UNION ALL
  
    SELECT
      "book" AS item,
      9 AS p
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(Price.p AS value, Price.item AS arg)))[0].arg AS item
FROM
  t_1_Price AS Price;