SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[0, 1], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (CAST(ROW(x_3) AS ROW(a double)) = CAST(ROW(x_3) AS ROW(a double))) ORDER BY x;