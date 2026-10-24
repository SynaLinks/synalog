SELECT
  (SELECT
  SUM(x_5) AS synalog_value
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_5
WHERE
  (x_5 > 1)) AS t;