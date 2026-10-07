SELECT
  x_10 AS name,
  (CONCAT((CONCAT('Hello, ', x_10)), '!')) AS message
FROM
  UNNEST(TRANSFORM(ARRAY['Alice', 'Bob', 'Charlie'], synalog_e -> ROW(synalog_e))) as pushkin(x_10) ORDER BY name;