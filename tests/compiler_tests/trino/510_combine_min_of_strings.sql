SELECT
  (SELECT
  MIN(x_4) AS synalog_value
FROM
  UNNEST(TRANSFORM(ARRAY['bee', 'ant', 'cat'], synalog_e -> ROW(synalog_e))) as pushkin(x_4)) AS m;