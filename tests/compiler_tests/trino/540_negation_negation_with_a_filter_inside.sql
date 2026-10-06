SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_8)
  WHERE
    (x_3 > 2) AND
    (x_3 = x_8)) IS NULL) ORDER BY x;