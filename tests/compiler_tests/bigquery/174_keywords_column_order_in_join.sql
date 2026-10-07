WITH t_0_M AS (SELECT * FROM (
  
    SELECT
      1 AS `order`
   UNION ALL
  
    SELECT
      2 AS `order`
  
) AS UNUSED_TABLE_NAME  )
SELECT
  M.`order` AS `order`,
  "a" AS v
FROM
  t_0_M AS M
WHERE
  (1 = M.`order`);