SELECT
  CAST(SUBSTR(x_2, 9, 2) AS BIGINT) AS day
FROM
  UNNEST(TRANSFORM(ARRAY['2024-01-31', '2024-02-01'], synalog_e -> ROW(synalog_e))) as pushkin(x_2) ORDER BY day;