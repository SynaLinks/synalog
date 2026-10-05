SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2]) as pushkin(x_3)
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    UNNEST(ARRAY[1]) as pushkin(x_7)
  WHERE
    (x_7 > 5) AND
    (x_3 = x_7)) IS NULL) ORDER BY x;