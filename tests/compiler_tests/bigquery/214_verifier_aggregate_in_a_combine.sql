WITH t_0_Total AS (SELECT
  SUM(x_8) AS t
FROM
  UNNEST(ARRAY[1, 3]) as x_8)
SELECT
  x_5 AS x,
  ((CAST(x_5 AS FLOAT64)) / (CAST(Total.t AS FLOAT64))) AS s
FROM
  t_0_Total AS Total, UNNEST(ARRAY[1, 3]) as x_5 ORDER BY x;