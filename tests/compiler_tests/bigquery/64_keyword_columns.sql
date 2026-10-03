WITH t_0_Line AS (SELECT * FROM (
  
    SELECT
      10 AS `order`,
      "a" AS `group`,
      1 AS `select`
   UNION ALL
  
    SELECT
      11 AS `order`,
      "b" AS `group`,
      2 AS `select`
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Line.`order` AS `order`,
  Line.`group` AS `group`,
  SUM(Line.`select`) AS total
FROM
  t_0_Line AS Line
GROUP BY `order`, `group` ORDER BY `order` DESC;