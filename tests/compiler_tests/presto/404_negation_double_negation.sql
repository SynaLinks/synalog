WITH t_0_NotB AS (SELECT
  x_8 AS x
FROM
  UNNEST(ARRAY[1, 2]) as pushkin(x_8)
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (x_8 = 2)) IS NULL))
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2]) as pushkin(x_3)
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_NotB AS NotB
  WHERE
    (NotB.x = x_3)) IS NULL);