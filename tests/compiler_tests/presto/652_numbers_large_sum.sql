SELECT
  SUM(((CAST(x_2 AS BIGINT)) * (1000000000))) AS t
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_2);