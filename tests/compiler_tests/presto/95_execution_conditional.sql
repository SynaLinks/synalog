SELECT
  x_4 AS x,
  CASE WHEN (x_4 < 0) THEN 'neg' WHEN (x_4 = 0) THEN 'zero' ELSE 'pos' END AS s
FROM
  UNNEST(TRANSFORM(ARRAY[3, -2, 0], synalog_e -> ROW(synalog_e))) as pushkin(x_4) ORDER BY x;