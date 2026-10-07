WITH t_0_Line AS (SELECT * FROM (
  
    SELECT
      10 AS `order`,
      "paid" AS `select`
   UNION ALL
  
    SELECT
      11 AS `order`,
      "open" AS `select`
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Line.`order` AS `order`
FROM
  t_0_Line AS Line
WHERE
  (Line.`select` = "paid");