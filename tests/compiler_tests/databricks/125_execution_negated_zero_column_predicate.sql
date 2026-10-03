SELECT
  x_3 AS x
FROM
  explode(ARRAY(1, 2)) AS pushkin(x_3)
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    explode(ARRAY(1, 2)) AS pushkin(x_7)
  WHERE
    (2 = x_7)) IS NULL);