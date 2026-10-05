SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]) as pushkin(x_3)
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    UNNEST(ARRAY[1, 2, 3]) as pushkin(x_9)
  WHERE
    ((MOD(x_3, 2)) = 0) AND
    (x_3 = x_9)) IS NULL) ORDER BY x;