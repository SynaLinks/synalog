SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    UNNEST(ARRAY[1, 2]) as x_7
  WHERE
    (2 = x_7)) IS NULL);