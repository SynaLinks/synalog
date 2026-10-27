SELECT
  (SELECT
  SUM(1) AS synalog_value
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_5, UNNEST(ARRAY[2, 3, 4]) as x_7
WHERE
  (x_7 IS NOT DISTINCT FROM x_5)) AS n;