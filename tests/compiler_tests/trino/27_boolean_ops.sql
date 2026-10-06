SELECT
  x_8 AS x,
  CASE WHEN (x_8 > 7) THEN 'very_high' WHEN (x_8 > 4) THEN 'high' WHEN (x_8 > 1) THEN 'medium' ELSE 'low' END AS cat
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 10), x -> x < 10), synalog_e -> ROW(synalog_e))) as pushkin(x_8) ORDER BY x;