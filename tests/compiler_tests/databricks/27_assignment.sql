SELECT
  x_8 AS col0,
  ((x_8) + (1)) AS col1
FROM
  explode(GENERATE_ARRAY(0, 5 - 1)) AS pushkin(x_8) ORDER BY col0;