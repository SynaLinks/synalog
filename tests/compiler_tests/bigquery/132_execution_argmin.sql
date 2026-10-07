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
  ARRAY_AGG(Price.item order by [Price.p][offset(0)] limit 1)[OFFSET(0)] AS item
FROM
  t_1_Price AS Price;