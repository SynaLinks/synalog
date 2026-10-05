WITH t_0_Total AS (SELECT
  SUM(x_8.value) AS t
FROM
  JSON_EACH(JSON_ARRAY(1, 3)) as x_8)
SELECT
  x_5.value AS x,
  (CAST(CAST(x_5.value AS FLOAT64) AS REAL) / (CAST(Total.t AS FLOAT64))) AS s
FROM
  t_0_Total AS Total, JSON_EACH(JSON_ARRAY(1, 3)) as x_5 ORDER BY x;