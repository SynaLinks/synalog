SELECT
  x_3 AS x,
  CASE WHEN (((x_3 > 1) AND (x_3 < 4)) OR (x_3 = 10)) THEN 1 ELSE 0 END AS y
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3, 10], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY x;