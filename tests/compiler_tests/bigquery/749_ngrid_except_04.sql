SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[4]) as x_3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (x_3 = 5)) IS NULL) ORDER BY x;