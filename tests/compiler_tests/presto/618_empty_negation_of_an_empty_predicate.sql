SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    UNNEST(TRANSFORM(ARRAY[1], synalog_e -> ROW(synalog_e))) as pushkin(x_6)
  WHERE
    (x_6 > 5) AND
    (x_3 = x_6)) IS NULL) ORDER BY x;