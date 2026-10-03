WITH t_0_Total AS (SELECT
  SUM(x_8) AS t
FROM
  explode(ARRAY(1, 3)) AS pushkin(x_8))
SELECT
  x_5 AS x,
  ((CAST(x_5 AS DOUBLE)) / (CAST(Total.t AS DOUBLE))) AS s
FROM
  t_0_Total AS Total, explode(ARRAY(1, 3)) AS pushkin(x_5) ORDER BY x;