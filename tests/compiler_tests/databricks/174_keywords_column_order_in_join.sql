WITH t_0_M AS (SELECT * FROM VALUES
  (1),
  (2)
AS UNUSED_TABLE_NAME(`order`))
SELECT
  M.`order` AS `order`,
  "a" AS v
FROM
  t_0_M AS M
WHERE
  (1 = M.`order`);