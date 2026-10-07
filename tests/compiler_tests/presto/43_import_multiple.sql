SELECT
  x_11 AS x,
  ((x_11) * (2)) AS doubled
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3, 4, 5], synalog_e -> ROW(synalog_e))) as pushkin(x_11)
WHERE
  (x_11 > 0) ORDER BY x;