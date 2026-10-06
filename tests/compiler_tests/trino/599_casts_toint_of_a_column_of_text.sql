SELECT
  SUM(CAST(x_2 AS BIGINT)) AS t
FROM
  UNNEST(TRANSFORM(ARRAY['5', '10'], synalog_e -> ROW(synalog_e))) as pushkin(x_2);