SELECT
  x_8 AS col0,
  CAST(x_8 AS STRING) AS col1
FROM
  explode(GENERATE_ARRAY(0, 5 - 1)) AS pushkin(x_8) ORDER BY col0;