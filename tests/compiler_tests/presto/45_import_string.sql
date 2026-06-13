SELECT
  x_10 AS name,
  (CONCAT((CONCAT('Hello, ', x_10)), '!')) AS message
FROM
  UNNEST(ARRAY['Alice', 'Bob', 'Charlie']) as pushkin(x_10) ORDER BY name;