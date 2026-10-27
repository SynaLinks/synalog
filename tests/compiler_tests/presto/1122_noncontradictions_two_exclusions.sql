SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 IS DISTINCT FROM 1) AND
  (x_3 IS DISTINCT FROM 2);