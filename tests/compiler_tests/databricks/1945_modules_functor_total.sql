WITH t_0_Mine AS (SELECT * FROM VALUES
  (4),
  (9),
  (1)
AS UNUSED_TABLE_NAME(x))
SELECT
  SUM(Mine.x) AS t
FROM
  t_0_Mine AS Mine;
