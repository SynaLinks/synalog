SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_3
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    UNNEST(ARRAY[1, 2, 3]) as x_8
  WHERE
    ((MOD(x_3, NULLIF(2, 0))) = 0) AND
    (x_3 = x_8)) IS NULL) ORDER BY x NULLS LAST;