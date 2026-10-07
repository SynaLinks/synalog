WITH t_0_R AS (SELECT * FROM VALUES
  ("a", 1),
  ("a", 2),
  ("b", 4)
AS UNUSED_TABLE_NAME(`group`, v))
SELECT
  R.`group` AS `group`,
  SUM(R.v) AS total
FROM
  t_0_R AS R
GROUP BY 1 ORDER BY `group` NULLS LAST;