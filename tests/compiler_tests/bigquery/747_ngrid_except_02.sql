SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    UNNEST(ARRAY[0]) as x_7
  WHERE
    (x_7 > 1) AND
    (x_3 = x_7)) IS NULL) ORDER BY x;