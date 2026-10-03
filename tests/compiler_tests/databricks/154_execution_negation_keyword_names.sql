SELECT
  x_3 AS x
FROM
  explode(ARRAY(1, 2)) AS pushkin(x_3)
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (x_3 = 1)) IS NULL);