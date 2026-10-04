SELECT
  x_3 AS x
FROM
  explode(ARRAY(1, 2)) AS pushkin(x_3)
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    explode(ARRAY(1, 2)) AS pushkin(x_9)
  WHERE
    (x_3 > 10) AND
    (x_3 = x_9)) IS NULL) ORDER BY x;