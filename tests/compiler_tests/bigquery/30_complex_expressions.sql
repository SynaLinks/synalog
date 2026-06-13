SELECT
  x_8 AS col0,
  CASE WHEN (x_8 < 3) THEN ((x_8) * (2)) WHEN (x_8 < 6) THEN ((x_8) + (10)) ELSE ((((x_8) * (x_8))) - (20)) END AS col1
FROM
  UNNEST(GENERATE_ARRAY(0, 10 - 1)) as x_8 ORDER BY col0;