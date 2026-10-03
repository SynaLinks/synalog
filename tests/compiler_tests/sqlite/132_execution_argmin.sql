WITH t_1_Price AS (SELECT * FROM (
  
    SELECT
      'pen' AS item,
      1 AS p
   UNION ALL
  
    SELECT
      'book' AS item,
      9 AS p
  
) AS UNUSED_TABLE_NAME  )
SELECT
  JSON_EXTRACT(ArgMin(Price.item, Price.p, 1), '$[' || 0 || ']') AS item
FROM
  t_1_Price AS Price;