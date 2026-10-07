SELECT
  SUM(x_2) AS t
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_2
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (x_2 = 2)) IS NULL);