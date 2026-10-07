SELECT
  x_9 AS c,
  (CONTAINS(ARRAY['red', 'blue', 'yellow'], x_9)) AS is_primary
FROM
  UNNEST(TRANSFORM(ARRAY['red', 'green', 'blue'], synalog_e -> ROW(synalog_e))) as pushkin(x_9) ORDER BY c;