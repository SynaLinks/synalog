SELECT
  CAST(x_3 AS STRING) AS s
FROM
  explode(ARRAY(9, 10)) AS pushkin(x_3) ORDER BY s;