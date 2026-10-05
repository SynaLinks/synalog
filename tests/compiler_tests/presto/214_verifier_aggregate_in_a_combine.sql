WITH t_0_Total AS (SELECT
  SUM(x_8) AS t
FROM
  UNNEST(ARRAY[1, 3]) as pushkin(x_8))
SELECT
  x_5 AS x,
  (CAST(CAST(x_5 AS DOUBLE) AS DOUBLE) / (CAST(Total.t AS DOUBLE))) AS s
FROM
  t_0_Total AS Total, UNNEST(ARRAY[1, 3]) as pushkin(x_5) ORDER BY x;